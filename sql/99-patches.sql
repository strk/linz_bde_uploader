﻿--------------------------------------------------------------------------------
--
-- linz_bde_uploader - LINZ BDE uploader for PostgreSQL
--
-- Copyright 2016 Crown copyright (c)
-- Land Information New Zealand and the New Zealand Government.
-- All rights reserved
--
-- This software is released under the terms of the new BSD license. See the 
-- LICENSE file for more information.
--
--------------------------------------------------------------------------------
-- Patches to apply to BDE control system. Note that the order of patches listed
-- in this file should be done sequentially i.e Newest patches go at the bottom
-- of the file. 
--------------------------------------------------------------------------------
SET client_min_messages TO WARNING;
SET search_path = bde_control, bde, public;

DO $PATCHES$
BEGIN

IF NOT EXISTS (
    SELECT *
    FROM   pg_extension EXT, 
           pg_namespace NSP
    WHERE  EXT.extname = 'dbpatch' 
    AND    NSP.oid = EXT.extnamespace 
    AND    NSP.nspname = '_patches'
) THEN
    RAISE EXCEPTION 'dbpatch extension is not installed correctly';
END IF;

-- Patches start from here


END;
$PATCHES$