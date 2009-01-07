# $Revision: 1.139 $
#    SAM-QFS_notice_begin
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at pkg/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at pkg/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2009 Sun Microsystems, Inc.  All rights reserved.
# Use is subject to license terms.
#
#    SAM-QFS_notice_end
T_SAM_CL_WRCLNT		"ClWrClnt: ord=%d,cmd=%x,seq=%d^2[$c]"
T_SAM_CL_WRSRVR		"ClWrSrvr: ord=%d,cmd=%x,seq=%d^2[$c]"
T_SAM_CL_WRCALLOUT	"ClWrCall: ord=%d,cmd=%x,seq=%d^2[$c]"
T_SAM_CL_WRSOCK_RET	"ClWrSock- err=%d,cmd=%x,seq=%d^2[$c]^1[$e]"
T_SAM_CL_WRSOCK_ERR	"ClWrSockE-err=%d,cmd=%x,seq=%d^2[$c]^1[$e]"
T_SAM_CL_RDCLNT		"ClRdClnt: err=%d,cmd=%x,seq=%d^2[$c]^1[$e]"
T_SAM_CL_RDSRVR		"ClRdSrvr: err=%d,cmd=%x,seq=%d^2[$c]^1[$e]"
T_SAM_CL_RDCLNT_RET	"ClRdClnt- err=%d,cmd=%x,seq=%d^2[$c]^1[$e]"
T_SAM_CL_RDSRVR_RET	"ClRdSrvr- err=%d,cmd=%x,seq=%d^2[$c]^1[$e]"
T_SAM_SETSERVER		"SetSrvr:  srvr=%s"
T_SAM_BEGSRVR		"BegSrvr:  st=%x,nsrvr=%d,sord=%d^1[$S]"
T_SAM_ENDSRVR		"EndSrvr:  st=%x,nsrvr=%d,sord=%d^1[$S]"
T_SAM_VOLFAILOVER	"SetVFail: srvr=%s"
T_SAM_VOLFAIL1		"VolFail1: st=%x,nsrvr=%d,cord=%d^1[$S]"
T_SAM_VOLFAIL2		"VolFail2: st=%x,nsrvr=%d,cord=%d^1[$S]"
T_SAM_SETCLIENT		"SetClnt:  srvr=%s"
T_SAM_BEGCLNT		"BegClnt:  st=%x,nsrvr=%d,psrvr=%d^1[$S]"
T_SAM_ENDCLNT		"EndClnt:  st=%x,nsrvr=%d,maxord=%d^1[$S]"
T_SAM_FAILOVER1		"Failover1:st=%x,busy=%d,active=%d^1[$S]"
T_SAM_FAILOVER2		"Failover2:st=%x,busy=%d,active=%d^1[$S]"
T_SAM_FAILOVER3		"Failover3:st=%x,busy=%d,active=%d^1[$S]"
T_SAM_FAIL_OLD1		"Failold1: st=%x,busy=%d,active=%d^1[$S]"
T_SAM_FAIL_OLD2		"Failold2: st=%x,busy=%d,active=%d^1[$S]"
T_SAM_FAIL_OLD3		"Failold3: st=%x,scall=%d,err=%d^[$e]"
T_SAM_FAIL_OLD4		"Failold4: st=%x,busy=%d,active=%d^1[$S]"
T_SAM_FAIL_NEW1		"Failnew1: st=%x,busy=%d,active=%d^1[$S]"
T_SAM_FAIL_NEW2		"Failnew2: st=%x,busy=%d,active=%d^1[$S]"
T_SAM_FAIL_NEW3		"Failnew3: st=%x,busy=%d,active=%d^1[$S]"
T_SAM_FAIL_NEW4		"Failnew4: st=%x,busy=%d,active=%d^1[$S]"
T_SAM_FREEZING		"Freezing: st=%x^[$S],busy=%d,active=%d"
T_SAM_LOCKFS		"Lockfs:   lck=%x,flg=%x,st=%x^[$S]"
T_SAM_LOCKFS_ST		"LockfsSt: lck=%x,flg=%x,st=%x^[$S]"
T_SAM_CL_WRCLNT_ER1	"ClWrClEr1 err=%d,ord=%d,p3=%d^1[$e]"
T_SAM_CL_WRCLNT_ER2	"ClWrClEr2 err=%d,ord=%d,p3=%d^1[$e]"
T_SAM_CL_WRCLNT_ER3	"ClWrClEr3 err=%d,ord=%d,p3=%d^1[$e]"
T_SAM_CL_WRCLNT_ER4	"ClWrClEr4 err=%d,ord=%d,p3=%d^1[$e]"
T_SAM_CL_WRSRVR_ER1	"ClWrSrEr1 err=%d,ord=%d,p3=%d^1[$e]"
T_SAM_CL_WRSRVR_ER2	"ClWrSrEr2 err=%d,ord=%d,p3=%d^1[$e]"
T_SAM_CL_EXPIRE		"ClExTask: st=%x^[$S]"
T_SAM_CL_EXPIRE_RET	"ClExTask- reason=%d,st=%x^[$S]"
T_SAM_SR_EXPIRE		"SrExTask: st=%x^[$S]"
T_SAM_SR_EXPIRE_RET	"SrExTask- reason=%d,st=%x^[$S]"
T_SAM_SR_RESYNC		"SrRsTask: st=%x^[$S]"
T_SAM_SR_RESYNC_RET	"SrRsTask- reason=%d,st=%x^[$S]"
T_SAM_CL_REEST		"ClRsTask: st=%x^[$S],thr=%x"
T_SAM_CL_REEST_RET	"ClRsTask- reason=%d,st=%x^[$S],thr=%x"
T_SAM_INVAL		"InvaTask: st=%x^[$S],cnt=%d"
T_SAM_INVAL_RET		"InvaTask- reason=%d,st=%x^[$S],cnt=%d"
T_SAM_QUOTA_INI		"Q init    line=%d,ip=%x,step=%d"
T_SAM_QUOTA_HLT		"Q halt    line=%d,op2=%x,step=%x"
T_SAM_QUOTA_HSW		"Q hashsw  qp=%x,type=%x,index=%x"
T_SAM_QUOTA_HSWE1	"Q hswerr1 qp=%x,type=%x,index=%x"
T_SAM_QUOTA_HSWE2	"Q hswerr2 qp=%x,type=%x,index=%x"
T_SAM_QUOTA_FIN		"Q fini    line=%d,p2=%x,step=%x"
T_SAM_QUOTA_FREE	"Q free    qp=%x,type=%x,index=%x"
T_SAM_QUOT_REL		"Q rel     qp=%x, ref=%d"
T_SAM_DAE_WAKE		"DaemWake: st=%x^[$S],event=%d^[$e]"
T_SAM_DAE_WOKE		"DaemWoke: st=%x^[$S],event=%d^[$e]"
T_SAM_DAE_HOLD		"DaemHold: nsock=%d,dfhold=%d,p3=%d"
T_SAM_DAE_RELE		"DaemRele: nsock=%d,dfhold=%d,p3=%d"
T_SAM_DAE_CNVT		"DaemCnvt: nsock=%d,dfhold=%d,p3=%d"
T_SAM_DEV_OPEN		"DevOpen:  eq=%d,state=%x,err=%d^[$e]"
T_SAM_DEV_CLOSE		"DevClose: eq=%d,state=%x,err=%d^[$e]"
T_SAM_MPGEN_DEC		"MP-DEC:   p1=%d,p2=%d,p3=%d"
T_SAM_MPGEN		"MP-HEX:   p1=%d,p2=%x,p3=%x"
T_SAM_OPEN_DEV		"OpenDev:  name=%s"
T_SAM_VGET_FREEZE	"VgetFreeze:   ino=%d,gen=%d"
T_SAM_VGET_UNFREEZE	"VgetUnFreeze- ino=%d,gen=%d,err=%d^[$e]"
T_SAM_CHG_STATE		"ChgState: ord=%d,st=%d,ng=%d"
T_SAM_CHG_STATE_ERR	"ChgStErr- ord=%d,st=%d,err=%d"
T_SAM_CHG_STATE_OK	"ChgState- ord=%d,st=%d,ng=%d"
T_SAM_NO_CHG_STATE	"NoChgSt-  ord=%d,st=%d,ng=%d"
T_SAM_MNT_INFO		"MntInfo:  st=%x^[$S],fscnt=%d,fsgen=%d"
T_SAM_MNT_INFO_RET	"MntInfo-  st=%x^[$S],fscnt=%d,fsgen=%d"
T_SAM_MNT_AVAIL1	""
T_SAM_MAX_MP		""
T_SAM_MOUNT		"Mount:    vfsp=%x, mount point vp=%x"
T_SAM_MNT_RET		"Mount-    mp=%x,rootvp=%x,cfg1=%x"
T_SAM_MNT_ERRLN		"MountErr: line=%d,err=%d^[$e],%d"
T_SAM_UMOUNT		"Unmount:  mp=%x, root vp=%x, cnt=%d"
T_SAM_UMNT_RET		"Unmount-  #%d,mp=%x,err=%d^[$e]"
T_SAM_ROOT		"Root:     vp=%x, cnt=%d"
T_SAM_STATVFS		"Statvfs:  NAMELEN=%d"
T_SAM_SYNC		"Sync:     flag=%d,n=%d,st=%x^[$S]"
T_SAM_SYNC_RET		"Sync-     flag=%d,n=%d,st=%x^[$S]"
T_SAM_VGET_RET		"Vget-     ino=%d,gen=%d,vp=%x"
T_SAM_VGET_ESRCH	"VgetErr-  ino=%d,gen=%d,err=%d^[$e]"
T_SAM_VGET_UMNTD	"VgetUmnt- vfsp=%x,line=%d,err=%d^[$e]"
T_SAM_MNT_ERR		"Mount-    #%d, mnt vp=%x, err=%d^[$e]"
T_SAM_MNT_ERRID		"Mount-    #%d, mnt id=%x, err=%d^[$e]"
T_SAM_FIND		"Find:     ino=%d,gen=%d,h=%d"
T_SAM_FLUSH_RET		"Flush-    err=%d^[$e]"
T_SAM_FIFO_REL		"F Release:hi=%d,cnt=%x,err=%d^[$e]"
T_SAM_FIFO_FSWM		"F FS-mark:eq=%d,state=%d,ost=%d"
T_SAM_WAIT_FSPACE1	"WaitSpc:  mp=%x,err=%d,fmsg=%x^2[$e]"
T_SAM_WAIT_FSPACE2	"WaitSpc-: mp=%x,err=%d,fmsg=%x^2[$e]"
T_SAM_VFS_FREE		"VFS_FREE: mp=%x,flag=%x,st=%x^[$S]"
T_SAM_VFS_AVAIL1	""
T_SAM_VFS_AVAIL2	""
T_SAM_VFS_AVAIL3	""
T_SAM_MAX_VFS		""
T_SAM_OPEN		"Open:     ino=%d,mode=%x^[$o],st=%x^[$s]"
T_SAM_OPEN_RET		"Open-     size=%x,flg=%x^[$f],err=%d^[$e]"
T_SAM_CLOSE		"Close:    ino=%d,flg=%x^[$f],rdev=%x"
T_SAM_CLOSE_RET		"Close-    rdev=%x,flg=%x^[$f],err=%d^[$e]"
T_SAM_READ		"Read:     ino=%d,off=%x,resid=%x"
T_SAM_READ_RET		"Read-     ino=%d,resid=%x,err=%d^[$e]"
T_SAM_WRITE		"Write:    ino=%d,off=%x,resid=%x"
T_SAM_WRITE_RET		"Write-    ino=%d,resid=%x,err=%d^[$e]"
T_SAM_IOCTL		"Ioctl:    cmd=%x,arg=%x,arg[0]=%x"
T_SAM_IOCTL_RET		"Ioctl-    cmd=%x,err=%d^[$e]"
T_SAM_SETATTR		"Setattr:  vap=%x,flag=%x^[$t],mask=%x^[$T]"
T_SAM_SETATTR_RET	"Setattr-  vap=%x,err=%d^[$e]"
T_SAM_ACCESS		"Access:   mode=%x^[$m],flags=%x"
T_SAM_ACCESS_RET	"Access-   ip->mode=%x^[$M],err=%d^[$e],ino=%d"
T_SAM_LOOKUP		"Lookup:   name=%s"
T_SAM_LOOKUP_RET	"Lookup-   vp=%x,ino=%d,nl=%d"
T_SAM_LOOKUP_ERR	"LookupEr- pino=%d,err=%d^[$e]"
T_SAM_LOOKUP_SP		"LookupSp- vp=%x,ino=%d,rdev=%x"
T_SAM_CREATE		"Create:   name=%s"
T_SAM_CREATE_RET	"Create-   vp=%x,ino=%d,nl=%d"
T_SAM_CREATE_ERR	"CreateEr- pino=%d,err=%d^[$e]"
T_SAM_REMOVE		"Remove:   name=%s"
T_SAM_REMOVE_RET	"Remove-   pino=%d,ino=%d,err=%d^[$e]"
T_SAM_LINK		"Link:     name=%s"
T_SAM_LINK_RET		"Link-     vp=%x,ino=%d,err=%d^[$e]"
T_SAM_RENAME1		"Rename1:  old=%s"
T_SAM_RENAME2		"Rename2:  new=%s"
T_SAM_RENAME_RET	"Rename-   vp=%x,ino=%d,err=%x^[$z]"
T_SAM_MKDIR		"Mkdir:    name=%s"
T_SAM_MKDIR_RET		"Mkdir-    vp=%x, ino=%d, err=%d^[$e]"
T_SAM_RMDIR		"Rmdir:    name=%s"
T_SAM_RMDIR_RET		"Rmdir-    pino=%d,ino=%d,err=%d^[$e]"
T_SAM_READDIR		"Readdir:  off=%x,len=%x,credp=%x"
T_SAM_READDIR_RET	"Readdir-  off=%x,err=%d^[$e]"
T_SAM_SYMLINK		"Symlink:  link name=%s"
T_SAM_SYMLINK_RET	"Symlink-  ino=%d,err=%d^[$e]"
T_SAM_READLINK		"Readlink: ino=%d,off=%x,len=%x"
T_SAM_READLINK_RET	"Readlink- ino=%d,off=%x,len=%x"
T_SAM_FSYNC		"Fsync:    mode=%x^[$o]"
T_SAM_FSYNC_RET		"Fsync-    err=%d^[$e]"
T_SAM_INACTIVE		"Inactive: cnt=%d,flags=%x^[$f],ino=%d"
T_SAM_INACT_STALE	"Inact st: cnt=%d,flags=%x^[$f],ino=%d"
T_SAM_INACTIVE_RET0	"Inactive0-cnt=%d,flags=%x^[$f],ino=%d"
T_SAM_INACTIVE_RET1	"Inactive1-cnt=%d,flags=%x^[$f],ino=%d"
T_SAM_INACTIVE_RET2	"Inactive2-cnt=%d,flags=%x^[$f],ino=%d"
T_SAM_INACTIVE_RET3	"Inactive3-cnt=%d,flags=%x^[$f],ino=%d"
T_SAM_INACTIVE_RET4	"Inactive4-cnt=%d,flags=%x^[$f],ino=%d"
T_SAM_INACTIVE_RET5	"Inactive5-cnt=%d,flags=%x^[$f],ino=%d"
T_SAM_INACTIVE_RET6	"Inactive6-cnt=%d,flags=%x^[$f],ino=%d"
T_SAM_FID		"Fid:      ino=%d,uid=%d,gid=%d"
T_SAM_FID_RET		"Fid-      ino=%d,gen=%d,vcode=%x"
T_SAM_RWLOCK		"Rwlock:   flag=%d^[$r],actual=%d^[$r]"
T_SAM_RWLOCK_RET	"Rwlock-   flag=%d^[$r]"
T_SAM_UNRWLOCK		"Unrwlock: flag=%d^[$r]"
T_SAM_UNRWLOCK_RET	"Unrwlock- flag=%d^[$r]"
T_SAM_RWDLOCK		"Rwdlock:  type=%d,use=%d"
T_SAM_RWDLOCK_RET	"Rwdlock-  type=%d,use=%d"
T_SAM_FRLOCK		"Frlock:   cmd=%d,flg=%x,off=%x"
T_SAM_FRLOCK_RET	"Frlock-   cmd=%d,flg=%x,err=%d^[$e]"
T_SAM_SPACE		"Space:    cmd=%x,off=%x,len=%x"
T_SAM_SPACE_RET		"Space-    err=%d^[$e]"
T_SAM_GETPAGE		"Getpage:  off=%x,len=%x,rw=%x^[$R]"
T_SAM_GETPAGE_RET	"Getpage-  err=%d^[$e],pglist=%x,opopen=%d"
T_SAM_READAHEAD		"Readahead-cntg=%x,off=%x,ra_off=%x"
T_SAM_PUTPAGE		"Putpage:  off=%x,len=%x,flg=%x^[$p]"
T_SAM_PUTPAGE_RET	"Putpage-  ino=%d,err=%d^[$e],mode=%x^[$M]"
T_SAM_MAP		"Map:      offu=%x,offl=%x,prot=%x^[$P]"
T_SAM_MAP_RET		"Map-      err=%d^[$e]"
T_SAM_ADDMAP		"Addmap:   off=%x,len=%x,prot=%x^[$P]"
T_SAM_ADDMAP_RET	"Addmap-   pages=%d,total=%d,err=%d^[$e]"
T_SAM_DELMAP		"Delmap:   off=%x,len=%x,prot=%x^[$P]"
T_SAM_DELMAP_RET	"Delmap-   pages=%d,total=%d,err=%d^[$e]"
T_SAM_READIO1		"Readio1:  off=%x,roff=%x,n=%x"
T_SAM_READIO2		"Readio2:  base=%x,resid=%x,flg=%x"
T_SAM_READ_N1		"Read_N1:  off=%x,roff=%x,n=%x"
T_SAM_READ_N2		"Read_N2:  base=%x,resid=%x,err=%d^[$e]"
T_SAM_GETAPAGE		"Getapage: off=%x,len=%x,rw=%x^[$R]"
T_SAM_GETAPAGE1		"Getapage1:vn_off=%x,vn_len=%x,pp=%x"
T_SAM_GETAPAGE2		"Getapage2:pglist=%x,plsize=%x,pp=%x"
T_SAM_UPDATEFS		"Updatefs: cnt=%d,ino=%d,flags=%x^[$f]"
T_SAM_FLUSH		"Flush:    ino=%d,cnt=%d,flags=%x^[$f]"
T_SAM_BUSY		"Umnt BUSY:ino=%d,cnt=%d,flags=%x^[$f]"
T_SAM_PUTAPAGE1		"Putapage1:off=%x,size=%x,pp=%x"
T_SAM_PUTAPAGE3		"Putapage3:off=%x,len=%x,pp=%x"
T_SAM_STARTBIO		"StartBkio:ord=%d,blk=%x,len=%x"
T_SAM_ASYNC_WR		"Async Wr: ino=%d,pp=%x,bp=%x"
T_SAM_DKMAP		"DKMap:    off=%x,ct=%x,flag=%x^[$q]"
T_SAM_DKMAP1		"DKMap1:   off=%x,size=%x,pboff=%x"
T_SAM_DKBLK		"DKBlk:    ino=%d,blk=%x,ord=%d"
T_SAM_DKMAP3		"DKMap3:   blk=%x,boff=%x,blen=%x"
T_SAM_DKMAP4		"DKMap4:   off=%x,reloff=%x,len=%x"
T_SAM_DKMAP5		"DKMap5:   off=%x,reloff=%x,len=%x"
T_SAM_DKMAP6		"DKMap6:   off=%x,reloff=%x,len=%x"
T_SAM_ZERODAU		"ZeroDau:  off=%x,len=%x,mask=%llx"
T_SAM_CONTIG		"Contig:   cntg=%x,bsz=%x,blk=%x"
T_SAM_FIFO_MT		"F Mount:  vsn=%s"
T_SAM_FIFO_UL		"F Unload: rdev=%x,fm=%x,iot=%x"
T_SAM_FIFO_ULN		"F Uname:  vsn=%s"
T_SAM_FIFO_STAGE	"F Stage:  vsn=%s"
T_SAM_FIFO_STAGEV	"F StageV: vsn=%s"
T_SAM_FIFO_CANRM	"F Can rm: ino=%d,cmd=%d,err=%d^[$e]"
T_SAM_REQ_RM		"Req RM:   vsn=%s"
T_SAM_IOCTL_MNT		"D Mount:  ino=%d,size=%x,rdev=%x"
T_SAM_IOCTL_UL		"D Unload: ino=%d,rerr=%d^[$e],rdev=%x"
T_SAM_IOCTL_POS		"D Positio:ino=%d,rerr=%d^[$e],rdev=%x"
T_SAM_IOCTL_STAGE	"D Stage:  ino=%d,off=%x,len=%x"
T_SAM_IOCTL_STERR	"D StErr:  ino=%d,gen=%d,sterr=%d^[$e]"
T_SAM_IOCTL_ERR		"D Error:  ino=%d,size=%d,fd=%d"
T_SAM_RMMAP		"RMMap:    size=%x,off=%x,cnt=%x"
T_SAM_RMMAP1		"RMMap1:   pboff=%x,dev=%x,blk=%x"
T_SAM_CACHE_INO1	"CacheIno1:ino=%d,cnt=%d,flags=%x^[$f]"
T_SAM_CACHE_INO2	"CacheIno2:ino=%d,cnt=%d,flags=%x^[$f]"
T_SAM_FREE_LIST		"Freelist: ino=%d,free=%x,IREF=%x"
T_SAM_ARCHIVE_MARK	"Arch mark:media=%x,cp=%d,err=%d^[$e]"
T_SAM_WRITEIO1		"Writeio1- off=%x,roff=%x,n=%x"
T_SAM_WRITEIO2		"Writeio2: base=%x,resid=%x,roff=%x"
T_SAM_UPDATE1		"Update1:  ino=%d,err=%d^[$e]"
T_SAM_FIND1		"Find1:    ino=%d,gen=%d,vcnt=%d"
T_SAM_FIND3		"Find3:    mode=%x,ino=%d,gen=%d"
T_SAM_FIND4		"Find4:    err=%d^[$e],ino=%d,gen=%d"
T_SAM_FIND5		"Find5:    err=%d^[$e],ino=%d,gen=%d"
T_SAM_CLEAN_FL		"Clean FL: ino=%d,inocnt=%d,flags=%x^[$f]"
T_SAM_CLEAN_HL		"Clean HL: ino=%d,hash=%x,flags=%x^[$f]"
T_SAM_TRUNCATE		"Truncate: ino=%d,size=%x,len=%x"
T_SAM_DNLC_LU		"Dnlc look:vp=%x,ino=%d,cnt=%x"
T_SAM_DNLC_LU_N		"Dnlc novn:vp=%x,err=%d^[$e],cnt=%x"
T_SAM_EDNLC_LU_E	"EDnlclkuE:off=%x,ino=%d,rec=%x"
T_SAM_EDNLC_LU_S	"EDnlclkuS:off=%x,len=%x,rec=%x"
T_SAM_EDNLC_ADD_E	"EDnlcAddE:off=%x,ino=%d,reply=%d^[$d]"
T_SAM_EDNLC_ADD_S	"EDnlcAddS:off=%x,len=%x,reply=%d^[$d]"
T_SAM_EDNLC_ERR		"EDnlc-Err:ino=%d,len=%x,err=%d^[$d]"
T_SAM_EDNLC_PURGE	"EDnlcPurg:ino=%d,#%d"
T_SAM_EDNLC_REM_D	"EDnlcRemD:reply=%d^[$d]"
T_SAM_EDNLC_REM_E	"EDnlcRemE:reply=%d^[$d]"
T_SAM_EDNLC_REM_H	"EDnlcRemH:off=%x,len=%x,reply=%d^[$d]"
T_SAM_EDNLC_REM_L	"EDnlcRemL:off=%x,len=%x,reply=%d^[$d]"
T_SAM_EDNLC_RET		"EDnlcRet: err=%d^[$e],#%d"
T_SAM_EDNLC_STR		"EDnlcStrt:ino=%d,size=%x,reply=%d^[$d]"
T_SAM_EDNLC_STR_RET	"EDnlcStrt-ino=%d"
T_SAM_GENERIC		"GENERIC:  p1=%d,p2=%x,p3=%x"
T_SAM_GENERICS		"GENERICS: name=%s"
T_SAM_SETSECATTR	"SETSECAT: vsap=%x,flag=%x,err=%d^[$e]"
T_SAM_GETSECATTR	"GETSECAT: vsap=%x,flag=%x,err=%d^[$e]"
T_SAM_INO_ALLOC		"Inoalloc: ino=%d,free=%d,inum=%d"
T_SAM_INO_FREE		"Inofree:  ino=%d,gen=%d,free=%d"
T_SAM_STWRIO1		"ST Wrio1: off=%x,roff=%x,n=%x"
T_SAM_STWRIO2		"ST Wrio2: base=%x,resid=%x,roff=%x"
T_SAM_STNWRIO1		"SN Wrio1: off=%x,roff=%x,n=%x"
T_SAM_STNWRIO2		"SN Wrio2: base=%x,resid=%x,err=%d^[$e]"
T_SAM_STAGE_WAIT	"ST wait:  %d,flags=%x,stsiz=%x"
T_SAM_STAGE_GO		"ST go:    ino=%d,flags=%x,err=%d^[$e]"
T_SAM_STAGE_ERR		"ST err:   err=%d^[$e],bits=%x,csiz=%x"
T_SAM_STAGE_DAEMON	"ST daemon:amld=%d,siz=%x,csiz=%x"
T_SAM_RM_WAIT		"RM wait:  ino=%d,flags=%x,wait=%d"
T_SAM_RM_GO		"RM go:    ino=%d,flags=%x,err=%d^[$e]"
T_SAM_SYSCALL		"Syscall:  cmd=%d"
T_SAM_SYSCALL_RET	"Syscall-  cmd=%d,err=%d^[$e],rv=%d"
T_SAM_DAEMON_CAN	"D Cancel: ino=%d,rdev=%x,err=%d^[$e]"
T_SAM_SWITCH_VOL	"SwitchVol:vsn=%s"
T_SAM_RES		"ResyncFifo:mp=%x,root=%x,fifo=%x"
T_SAM_IOCTL_EMNT	"D ErrMnt: ino=%d,path=%d,err=%d^[$e]"
T_SAM_IOCTL_STCAN	"D StCan:  ino=%d,sterr=%d^[$e],flags=%x"
T_SAM_DIORDBLK_ST	"DioRdBkSt:blk=%x,off=%x,len=%x"
T_SAM_DIOWRBLK_ST	"DioWrBkSt:blk=%x,off=%x,len=%x"
T_SAM_DIORDOBJ_ST	"DioRdObSt:cnt=%x,off=%x,len=%x"
T_SAM_DIOWROBJ_ST	"DioWrObSt:cnt=%x,off=%x,len=%x"
T_SAM_PGRDOBJ_ST	"PgRdObSt: loff=%x,off=%x,len=%x"
T_SAM_PGWROBJ_ST	"PgWrObSt: loff=%x,off=%x,len=%x"
T_SAM_DIORDBLK_COMP	"DioRdBkCo:blk=%x,cnt=%d,bdp=%x"
T_SAM_DIOWRBLK_COMP	"DioWrBkCo:blk=%x,cnt=%d,bdp=%x"
T_SAM_DIORDOBJ_COMP	"DioRdObCo:objid=%x,off=%x,len=%x"
T_SAM_DIOWROBJ_COMP	"DioWrObCo:objid=%x,off=%x,len=%x"
T_SAM_PGRDOBJ_COMP	"PgRdObCo: objid=%x,off=%x,len=%x"
T_SAM_PGWROBJ_COMP	"PgWrObCo: objid=%x,off=%x,len=%x"
T_SAM_DIOWAIT		"DioWait:  err=%d^[$e],cnt=%d,bdp=%x"
T_SAM_DIOKERN		"DioKernel:uio=%x,rdev=%x,bdp=%x"
T_SAM_DIOPAGES		"DioPages: off=%x,adj_len=%x"
T_SAM_AIODONE		"AioDone:  rdev=%x,cnt=%x,bdp=%x"
T_SAM_AIOERR		"AioError: rdev=%x,cnt=%x,bdp=%x"
T_SAM_RMINCORE		"RmIncore: ino=%d,cnt=%d,flags=%x^[$f]"
T_SAM_KPINCORE		"KpIncore: ino=%d,cnt=%d,flags=%x^[$f]"
T_SAM_DDMAP		"DdMap:    off=%x,ct=%x,flag=%x^[$q]"
T_SAM_DDMAP1		"DdMap1:   off=%x,size=%x,pboff=%x"
T_SAM_DDBLK		"DdBlk:    ino=%d,blk=%x,ord=%d"
T_SAM_FLUSHERR1		"Flusherr1:ino=%d,cnt=%d,flags=%x^[$f]"
T_SAM_FLUSHERR2		"Flusherr2:ino=%d,cnt=%d,flags=%x^[$f]"
T_SAM_FLUSHERR3		"Flusherr3:ino=%d,cnt=%d,flags=%x^[$f]"
T_SAM_FLUSHERR4		"Flusherr4:ino=%d,cnt=%d,flags=%x^[$f]"
T_SAM_UMNT_IGET		"IgetUmnt: st=%x^[$S],mp=%x,err=%d^[$e]"
T_SAM_CACHE_1		"Cache_1:  ino=%d,gen=%d,cnt=%d"
T_SAM_CACHE_2		"Cache_2:  ino=%d,gen=%d,cnt=%d"
T_SAM_FIFO_CANST	"F Can st: ino=%d,size=%x,err=%d^[$e]"
T_SAM_GROUPIO1		"GroupIO1: ord=%d,resid=%x,contig=%x"
T_SAM_GROUPIO2		"GroupIO2: ord=%d,resid=%x,contig=%x"
T_SAM_GETSEGMENT	"GetSegment:ino=%d,si=%d,cnt=%d"
T_SAM_RELSEGMENT	"RelSegment:ino=%d,si=%d,cnt=%d"
T_SAM_RMRESUME		"RMResume: ino=%d,cnt=%d,flags=%x"
T_SAM_RMDIRENT		"RMDirent: ino=%d,gen=%d,parent=%d"
T_SAM_RM_STOP		"RMStop:   ino=%d,cnt=%d,flags=%x"
T_SAM_DAEMON_STOP	"DMStop:   ino=%d,cnt=%d,flags=%x"
T_SAM_STAGE_STOP	"STStop:   ino=%d,cnt=%d,flags=%x"
T_SAM_IOCTL_SERROR	"D Sterror:ino=%d,size=%d,err=%d^[$e]"
T_SAM_BREAD_ERR		"Bread err:err=%d^[$e],ord=%x,blk=%x"
T_SAM_ARCH_WAIT		"ARCH wait:ino=%d,flags=%x,wait=%d"
T_SAM_ARCH_GO		"ARCH go:  ino=%d,flags=%x,err=%d^[$e]"
T_SAM_CACHE_E1		"Cache_Er1:ino=%d,gen=%d,err=%d^[$e]"
T_SAM_CACHE_E2		"Cache_Er2:ino=%d,gen=%d,err=%d^[$e]"
T_SAM_QKMAP		"QKMap:    off=%x,ct=%x,flag=%x^[$q]"
T_SAM_OKMAP		"ObMap:    off=%x,ct=%x,flag=%x^[$q]"
T_SAM_SAN_GETF		"GFCookie: upath=%x,ubuf=%x,ulenp=%x"
T_SAM_SAN_FALLOC	"FM alloc: ino=%d,size=%x,newlen=%x"
T_SAM_SAN_GETFX		"GFCookie- err=%d^[$e],buflen=%x"
T_SAM_SAN_HOLD		"SAN +hold ino=%d.%d"
T_SAM_SAN_RELSE		"SAN -hold ino=%d.%d"
T_SAM_SAN_GETMAP	"Map:      ubuf=%x,ulenp=%x,loflags=%x"
T_SAM_SAN_EXIT		"M exit:   err=%d^[$e],buflen=%x"
T_SAM_SAN_ERR		"SAN err:  line=%d,err=%d^[$e],op3=%x"
T_SAM_MAPFLT		"Mapfault: off=%x,len=%x,vpg=%x"
T_SAM_VCOUNT		"Vcount:   line=%d,v_count=%d"
T_SAM_NLNKCNT		"Nlink:    line=%d,nlink=%d,ip=%x"
T_SAM_QUOT_GET		"Q get     type/index=%d/%d, p3=%x"
T_SAM_QUOT_NODQ		"Q nodq    type/index=%d/%d,why=%x"
T_SAM_QUOT_SRCH		"Q srch    type/index=%d/%d, p3=%x"
T_SAM_QUOT_GOTNEW	"Q new     type/index=%d/%d, qp=%x"
T_SAM_QUOT_GOTATT	"Q att     type/index=%d/%d, qp=%x"
T_SAM_QUOT_GOT		"Q old     type/index=%d/%d, qp=%x"
T_SAM_QUOTA_FLUSH	"Q flush   type/index=%d/%d, qp=%x"
T_SAM_QUOTA_FLUSH2	"Q flush2  type/index=%d/%d, qp=%x"
T_SAM_QUOTA_FLUSHD	"Q flushed qp=%x,p2=%d,err=%d"
T_SAM_QUOTA_OP		"Q op      line=%d,p2=%x,p3=%x"
T_SAM_QUOTA_OPERR	"Q operr   line=%d,p2=%x,err=%d"
T_SAM_QUOTA_INO_FIN	"Q i fin   ino=%d,type=%d,step=%d"
T_SAM_QUOTA_ALLOCB	"Q allocb  blks=%d,blks2=%d,p3=%x"
T_SAM_QUOTA_RETBLK	"Q retb    line=%d,blks=%d,blks2=%d"
T_SAM_QUOTA_FILE	"Q allocf  aid=%d,gid=%d,uid=%d"
T_SAM_QUOTA_RETFILE	"Q retf    p1=%x,p2=%x,p3=%x"
T_SAM_QUOTA_READ	"Q read    p1=%d,typ/index=%d/%d"
T_SAM_QUOTA_READDEF	"Q readdef p1=%d,typ/index=%d/%d"
T_SAM_INO_EXT_ALLOC	"InoExall: ino=%d,ext=%d,mode=%x"
T_SAM_INO_EXT_FREE	"InoExfre: ino=%d,ext=%d,mode=%x"
T_SAM_RESTOR_FILE	"Restore:  name=%s"
T_SAM_PSYSCALL		"PrivScall:cmd=%d"
T_SAM_PSYSCALL_RET	"PrivScall-cmd=%d,err=%d^[$e],rv=%d"
T_SAM_PSAMCALL		"PSamScall:cmd=%d"
T_SAM_PSAMCALL_RET	"PSamScall-cmd=%d,err=%d^[$e],rv=%d"
T_SAM_SET_MVA_EXT	"SetExMVA: copy=%d,nvsns=%d,err=%d^[$e]"
T_SAM_GET_MVA_EXT	"GetExMVA: copy=%d,nvsns=%d,err=%d^[$e]"
T_SAM_SET_SLN_EXT	"SetExSLN: ino=%d,nchars=%d,err=%d^[$e]"
T_SAM_GET_SLN_EXT	"GetExSLN: ino=%d,nchars=%d,err=%d^[$e]"
T_SAM_SET_RFA_EXT	"SetExRFA: size=%d,nvsns=%d,err=%d^[$e]"
T_SAM_GET_RFA_EXT	"GetExRFA: size=%d,nvsns=%d,err=%d^[$e]"
T_SAM_SET_HLP_EXT	"SetExHLP: ino=%d,eino=%d,err=%d^[$e]"
T_SAM_GET_HLP_EXT	"GetExHLP: ino=%d,found=%d,err=%d^[$e]"
T_SAM_SET_ACL_EXT	"SetExACL: ino=%d,nacls=%d,err=%d^[$e]"
T_SAM_GET_ACL_EXT	"GetExACL: ino=%d,nacls=%d,err=%d^[$e]"
T_SAM_ACL_ERR		"ACL err:  ino=%d,line=%d,err=%d^[$e]"
T_SAM_CACL_ERR		"CACL err: ino=%d,line=%d,err=%d^[$e]"
T_SAM_ACL_CHMODE	"ACL mode: ino=%d,mode=%o,line=%d"
T_SAM_ACL_CLRETRY	"ACL retry error=%d^[$e],p2=%d,p3=%d"
T_SAM_CL_OPEN		"ClOpen:   ino=%d,mode=%x^[$o],st=%x"
T_SAM_CL_OPEN_RET	"ClOpen-   size=%x,opn=%d,err=%d^[$e]"
T_SAM_CL_CLOSE		"ClClose:  ino=%d,l=%x,flg=%x^[$f]"
T_SAM_CL_CLOSE_RET	"ClClose-  l=%x,size=%lld,err=%d^[$e]"
T_SAM_CL_READ		"ClRead:   ino=%d,off=%x,resid=%x"
T_SAM_CL_WRITE		"ClWrite:  ino=%d,off=%x,resid=%x"
T_SAM_CL_SETATTR	"ClSetattr:vap=%x,flg=%x^[$t],mask=%x^[$T]"
T_SAM_CL_SETATT_RET	"ClSetattr-size=%lld,mode=%x,err=%d^[$e]"
T_SAM_CL_LOOKUP		"ClLookup: name=%s"
T_SAM_CL_LOOKUP_RET	"ClLookup- vp=%x,ino=%d,nl=%d"
T_SAM_CL_LOOKUP_ERR	"ClLookEr- pino=%d,err=%d^[$e]"
T_SAM_CL_CREATE		"ClCreate: name=%s"
T_SAM_CL_CREATE_RET	"ClCreate- vp=%x,ino=%d,err=%d^[$e]"
T_SAM_CL_REMOVE		"ClRemove: name=%s"
T_SAM_CL_REMOVE_RET	"ClRemove- pino=%d,ino=%d,err=%d^[$e]"
T_SAM_CL_MKDIR		"ClMkdir:  name=%s"
T_SAM_CL_MKDIR_RET	"ClMkdir-  vp=%x,ino=%d,size=%lld"
T_SAM_CL_MKDIR_ERR	"ClMkdir-  vp=%x,ino=%d,err=%d^[$e]"
T_SAM_CL_RMDIR		"ClRmdir:  name=%s"
T_SAM_CL_RMDIR_RET	"ClRmdir-  pino=%d,ino=%d,err=%d^[$e]"
T_SAM_CL_READDIR	"CLReaddir:off=%x,len=%x,credp=%x"
T_SAM_CL_SYMLINK	"ClSymlink:link name=%s"
T_SAM_CL_SYMLN_RET	"ClSymlink-ino=%d,err=%d^[$e]"
T_SAM_CL_READLINK	"ClReadln: ino=%d,off=%x,len=%x"
T_SAM_CL_LINK		"ClLink:   name=%s"
T_SAM_CL_LINK_RET	"ClLink-   vp=%x,ino=%d,err=%d^[$e]"
T_SAM_CL_RENAME1	"ClRename1:old=%s"
T_SAM_CL_RENAME2	"ClRename2:name=%s"
T_SAM_CL_RENAME_RET	"ClRename- vp=%x,ino=%d,err=%d^[$e]"
T_SAM_CL_SPACE		"ClSpace:  cmd=%x,off=%x,len=%x"
T_SAM_CL_SEND_ERR	"ClSendErr:cmd=%x,seq=%d,err=%d^1[$c]^3[$e]"
T_SAM_SRVR_WAIT		"SrvrWait: cmd=%x,seq=%d,wait=%d^1[$c]"
T_SAM_FINISH_MSG	"FiniMsg:  cmd=%x,seq=%d,err=%d^1[$c]^3[$e]"
T_SAM_SRVR_GO		"SrvrGo:   cmd=%x,seq=%d,err=%d^1[$c]^3[$e]"
T_SAM_CLNT_DELAY	"ClntDelay:cmd=%x,seq=%d,st=%x^[$S]^1[$c]"
T_SAM_CLNT_GO		"ClntGo:   cmd=%x,seq=%d,err=%d^1[$c]^3[$e]"
T_SAM_CL_LEASE		"ClLease:  l=%x^[$L],allsz=%x,err=%d^[$e]"
T_SAM_CL_TRUNC		"ClTrunc:  l=%x^[$L],allsz=%x,err=%d^[$e]"
T_SAM_CL_NAME		"ClName:   l=%x^[$L],flg=%x^[$f],err=%d^[$e]"
T_SAM_CL_INODE		"ClInode:  l=%x^[$L],flg=%x^[$f],err=%d^[$e]"
T_SAM_CL_SEQNO		"ClSeqno:  seq=%x,gen=%x,ord=%d"
T_SAM_SR_SEQNO		"SrSeqno:  seq=%x,gen=%x,ord=%d"
T_SAM_SR_LEASE		"SrLease:  ord=%d,typ=%x^[$l],size=%lld"
T_SAM_SR_LEASE_RET	"SrLease-  sz=%lld,act=%x^[$a],err=%d^[$e]"
T_SAM_SR_NAME		"SrName:   ord=%d,op=%x,pino=%d"
T_SAM_SR_LOOK_RET	"SrLook-   ino=%d,gen=%d,size=%lld"
T_SAM_SR_INODE		"SrInode:  ord=%d,op=%d,size=%lld"
T_SAM_SR_INODE_RET	"SrInode-  sz=%lld,act=%x^[$a],err=%d^[$e]"
T_SAM_SR_BLOCK		"SrBlock:  blk=%x,ord=%d,bsz=%lld"
T_SAM_SR_FBLOCK		"SrFblock: off=%llx,len=%d,ino=%d"
T_SAM_SR_INO		"SrInode:  ino=%d,bsz=%lld,err=%d^[$e]"
T_SAM_CL_FRLOCK		"ClFrlock: cmd=%d,typ=%x,off=%x"
T_SAM_CL_FRLOCK_RET	"ClFrlock- pid=%d,sysid=%x,err=%d^[$e]"
T_SAM_CL_GETPAGE	"ClGetpage:off=%x,len=%x,rw=%x^[$R]"
T_SAM_CL_GETPG_RET	"ClGetpage-err=%d^[$e],pp=%x,off=%x"
T_SAM_CL_ADDMAP		"ClAddmap: off=%x,len=%x,prot=%x^[$P]"
T_SAM_CL_ADDMAP_RET	"ClAddmap- pages=%d,total=%d,err=%d^[$e]"
T_SAM_CL_DELMAP		"ClDelmap: off=%x,len=%x,prot=%x^[$P]"
T_SAM_CL_DELMAP_RET	"ClDelmap- pages=%d,total=%d,err=%d^[$e]"
T_SAM_FREEZE_INO	"Freeze:   ino=%d,gen=%d,flg=%x^[$f]"
T_SAM_UNFREEZE_INO	"UnFreeze- ino=%d,gen=%d,flg=%x^[$f]"
T_SAM_CL_BREAD_ERR	"ClBreader:err=%d^[$e],ord=%x,blk=%x"
T_SAM_LEASE_ADD		"LeaseAdd: ino=%d,client=%d,mask=%x^[$L]"
T_SAM_LEASE_REMOVE	"LeaseRmv: ino=%d,client=%d,mask=%x^[$L]"
T_SAM_LEASE_EXPIRE	"LeaseExp: ino=%d,client=%d,mask=%x^[$L]"
T_SAM_GENERIC_DEC	"GEN-DEC:  p1=%d,p2=%d,p3=%d"
T_SAM_GENERIC_INO	"GEN-Ino:  p1=%d,ino=%d,p3=%x"
T_SAM_FAILOVER_WIN	"Failover: case %d, ino=%d"
T_SAM_IOCTL_DMR		"Mirror R: off=%x, len=%x, side=%x"
T_SAM_IOCTL_DMR_ERR	"Mirror E: off=%x, side=%d, err=%d^[$e]"
T_SAM_ABR_SDR		"DIO dact  ino=%d,p2=%x,p3=%x"
T_SAM_ABR_IOCTL		"ABR ioctl ino=%d,vcset=%x,oldabr=%x"
T_SAM_ABR_SET		"ABR set   ino=%d,p2=%x,oldabr=%x"
T_SAM_ABR_2SRVR		"ABR->SRVR ino=%d,abr=%x,oldabr=%x"
T_SAM_ABR_LOPEN		"ABR lopen ino=%d,abr=%x,shflags=%x"
T_SAM_ABR_LADD		"ABR ladd  ino=%d,mask=%x,bits(ip:ix:inp)=%x"
T_SAM_ABR_DACT		"ABR dact  ino=%d,p2=%x,actions=%x"
T_SAM_ABR_CLR		"ABR clear ino=%d,clients=%d,nl=%d"
T_SAM_ABR_INIT		"ABR init  ino=%d,abr=%d,oabr=%d"
T_SAM_CADIO		"ClrApDIO: ipsize=%x, offset=%x, size=%x"
T_SAM_DIOUAR		"DIOUAR:   off=%x, cnt=%x, size=%x"
T_SAM_UMNT_INO		"Umnt ino: p1=%x,p2=%x,line=%d"
T_SAM_KSTALE_VNO	"clo stale vcnt=%d,last=%d,opens=%d"
T_SAM_KSTALE_VNOERR	"clo sterr vcnt=%d,last=%d,opens=%d"
T_SAM_STALE_INO		"stale ino ino=%d,cnt=%d,flags=%x^[$f]"
T_SAM_STALE_PP		"wr stalep ino=%d,flg=%x^[$p],p3=%d"
T_SAM_TRACE_READ	"trace rd  nent=%d,cpu=%x,err=%d^[$e]"
T_SAM_CL_EXP_INUSE	"ClExpUsed:expmask=%x^[$L],used=%x^[$L]"
T_SAM_OBJ_PAGEZERO	"ObjPgZero:loff=%x,off=%x,eoo=%x"
T_SAM_LOOKUP_XATTR	"LookupX:  pino=%d,xattr=%x,flg=%x^[$F],"
T_SAM_LOOKUP_XA_RET	"LookupX-  vp=%x,ino=%d,nl=%d"
T_SAM_LOOKUP_XA_ERR	"LookupXEr-pino=%d,err=%d^[$e]"
T_SAM_XA_FREE		"XAFree:   ino=%d,gen=%d,d1=%d"
T_SAM_XA_FREE_RET	"XAFree-:  ino=%d,gen=%d,err=%d^[$e]"
T_SAM_SR_LOOKX_RET	"SrLookX-  ino=%d,gen=%d,size=%lld"
T_SAM_SR_LOOK_ERR	"SrLook-   flags=%x,err=%d^[$e]"
T_SAM_OBJ_LAY_CRE	"ObjLayCre:ino=%d,gen=%d,ngrp=%d"
T_SAM_OBJ_LAY_DES	"ObjLayDes:ino=%d,gen=%d,olp=%x"
