Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8FBCC433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Mar 2021 17:39:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66BCC64FEE
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Mar 2021 17:39:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbhCKRin (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Mar 2021 12:38:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhCKRiX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Mar 2021 12:38:23 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73159C061574
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Mar 2021 09:38:22 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so9421415pjq.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Mar 2021 09:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZyO2J6W4yzOswPxtbRFYy2YD4AnMc1XnpR1PaDWSVoc=;
        b=FUr+2SPbP5A2lq2k9KMreqBCmNH1o8sLQqYoxPbF9TEjaLeEtwG3keJx4dJe0F4NrO
         H0Bkl4M+4dH2ZI6JsQoo1vcSrJYQh516c72QHjIud4bvedTyjLAc8pIKf8tjXu7YM/Dt
         E9gPwEJDfFXfhuU5lkKhzITYlE0QrPWQ17XCwt4jpfF/1x/cYjkaXY1oWlLxgiCleE3q
         fqopIjvyW8uZdUO9yxlPeGwWSOXEcJkNibY855xSieNAJRo3QG6YMeVc4EbBXNNrLor7
         /5Rl4vS1ROoycsfNK771xaL3Fx1f10zewx1TouIF/TNTQorOhUxv0njBRQsVWQBftAeP
         d5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZyO2J6W4yzOswPxtbRFYy2YD4AnMc1XnpR1PaDWSVoc=;
        b=H9ps1Jyc99pZZ2y/b8yB1PYcvZ9X9DvjoCHSF8wMLC+4WIxsB+R976HV61b4Dl41mE
         UkW/1sQLxobixWLRhYQtqsrDNC/MzuJP6+y9t0pmeGE7I7VpUs4blNJdJprUmMPQsc7T
         oTrdgh1FfM4gt6oSlSucFxEbcyg1I580Ieir1cuZZ6gP3ATjs84mAHT6q8zn2bXJsIfR
         ql15Axzv6dYg7YTULsVJVoBCA2kC4y0V7F2Y/EHkYfTGrxbtlvJKgACjSVq8wCe5+nfR
         wCXMJVwECj1dc4NkB6xCx28PzT5D6drEuxClFhai3R6A8oaD1PepRgzCGGmgQTBNMBe+
         jrVQ==
X-Gm-Message-State: AOAM533QA+d84rojK9RceDPJCVaSHGjGS6z9IPakisc6BWA2d2N8mbO3
        2KPmfLjRV/5zneiz76NSgLkc7w==
X-Google-Smtp-Source: ABdhPJxwgv322z4GtiGEYMD9Ebnf6NDqF7umKc6h1guwT6ka8rA03h7ugFkRLhQXYv2tzwYU1PGWjw==
X-Received: by 2002:a17:90a:d184:: with SMTP id fu4mr7673300pjb.236.1615484301895;
        Thu, 11 Mar 2021 09:38:21 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id mz11sm2901827pjb.6.2021.03.11.09.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 09:38:21 -0800 (PST)
Date:   Thu, 11 Mar 2021 10:38:18 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "patrice.chotard@st.com" <patrice.chotard@st.com>
Subject: Re: [PATCH V13 00/10] remoteproc: imx_rproc: support iMX8MQ/M
Message-ID: <20210311173818.GB1113417@xps15>
References: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
 <20210308160815.GB3977653@xps15>
 <DB6PR0402MB276009028DF766731BB2C06888909@DB6PR0402MB2760.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB6PR0402MB276009028DF766731BB2C06888909@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Mar 11, 2021 at 01:26:25AM +0000, Peng Fan (OSS) wrote:
> Mathieu,
> 
> > Subject: Re: [PATCH V13 00/10] remoteproc: imx_rproc: support iMX8MQ/M
> > 
> > On Sat, Mar 06, 2021 at 07:24:15PM +0800, peng.fan@oss.nxp.com wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > V13:
> > >  Add R-b tag from Rob for patch 1.
> > >  Drop the reserved memory node from patch 2 per Rob's comment.
> > >  Mathieu, Bjorn
> > >   Only patch 2 not have R-b/A-b tag, but since Rob's only has a minor
> > comment, and
> > >   addressed in this version, is it ok for you take into remoteproc next
> > branch?
> > >   Thanks.
> > 
> > As much as I want to, there is no way to move forward without an
> > acknowledgement from Rob.
> 
> Rob has gave his R-b tag for patch 2/13, please help pick up this patchset.
> I really wanna this feature in which has been for a long time. Then
> I will move on to add new stuff.
>

This set looks good to me - Bjorn will likely pick it up shortly.
 
> Thanks,
> Peng.
> 
> 
> > 
> > >
> > > V12:
> > >  Add maxItems to avoid dt_bindings_check fail  Rebased on top of
> > > linux-next
> > >
> > > V11:
> > >  Per Rob's comments, fix memory-region in patch 1/10  Rebased on top
> > > of Linux-next
> > >
> > > V10:
> > >  Per Rob's comments, fix patch 1/10
> > >
> > > V9:
> > >  Per Mathieu's comments,
> > >    update the tile of yaml in patch 2/10
> > >    update the Kconfig and MODULE_DESCRIPTION, I merge this change in
> > patch 8/10,
> > >    since this is a minor change, I still keep Mathieu's R-b tag. If any
> > objection, I could remove.
> > >    Add R-b tag in Patch 10/10
> > >
> > >  Rob, please help review patch 1/10 and 2/10
> > >
> > > V8:
> > >  Address sparse warning in patch 4/10 reported by kernel test robot
> > >
> > > V7:
> > >  Add R-b tag from Mathieu
> > >  vdevbuffer->vdev0buffer in patch 1/10, 7/10  correct err msg and
> > > shutdown seq per Mathieu's comments in patch 10/10  Hope this version
> > > is ok to be merged.
> > >
> > > V6:
> > >  Add R-b tag from Mathieu
> > >  Convert imx-rproc.txt to yaml and add dt-bindings support for
> > > i.MX8MQ/M, patch 1/10 2/10  No other changes.
> > >
> > > V5:
> > >  Apply on Linux next
> > >  Add V5 subject prefix
> > >  Add R-b tag from Bjorn for 1/8, 2/8, 3/8
> > >
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatc
> > >
> > hwork.kernel.org%2Fproject%2Flinux-remoteproc%2Fcover%2F20201229033
> > 019
> > > .25899-1-peng.fan%40nxp.com%2F&amp;data=04%7C01%7Cpeng.fan%40n
> > xp.com%7
> > >
> > C18c2709725e14cbab54408d8e24c6492%7C686ea1d3bc2b4c6fa92cd99c5c3
> > 01635%7
> > >
> > C0%7C0%7C637508165016988280%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> > MC4wLjAwMD
> > >
> > AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata
> > =bwlT
> > > uTk6iRuZke6SMhuyB2gxniStfxnX%2BKlVgm7MZuk%3D&amp;reserved=0
> > >
> > > V4:
> > >  According to Bjorn's comments, add is_iomem for da to va usage  1/8,
> > > 2/8 is new patch  3/8, follow Bjorn's comments to correct/update the
> > > err msg.
> > >  6/8, new patch
> > >  8/8, use dev_err_probe to simplify code, use queue_work instead
> > > schedule_delayed_work
> > >
> > > V3:
> > >  Since I was quite busy in the past days, V3 is late  Rebased on
> > > Linux-next  Add R-b tags
> > >  1/7: Add R-b tag of Mathieu, add comments
> > >  4/7: Typo fix
> > >  5/7: Add R-b tag of Mathieu, drop index Per Mathieu's comments
> > >  6/7: Add R-b tag of Mathieu
> > >  7/7: Add comment for vqid << 16, drop unneeded timeout settings of
> > mailbox
> > >       Use queue_work instead of schedule_delayed_work
> > >       free mbox channels when remove
> > >
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml
> > > .org%2Flkml%2F2020%2F12%2F4%2F82&amp;data=04%7C01%7Cpeng.fan
> > %40nxp.com
> > > %7C18c2709725e14cbab54408d8e24c6492%7C686ea1d3bc2b4c6fa92cd9
> > 9c5c301635
> > > %7C0%7C0%7C637508165016988280%7CUnknown%7CTWFpbGZsb3d8eyJ
> > WIjoiMC4wLjAw
> > >
> > MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd
> > ata=xQ
> > >
> > ReFFdUT2ZLhWyT2Vt2v0frG0xKq2psP1ExnLx%2BLXw%3D&amp;reserved=0
> > >
> > > V2:
> > >  Rebased on linux-next
> > >  Dropped early boot feature to make patchset simple.
> > >  Drop rsc-da
> > >
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatc
> > >
> > hwork.kernel.org%2Fproject%2Flinux-remoteproc%2Fcover%2F20200927064
> > 131
> > > .24101-1-peng.fan%40nxp.com%2F&amp;data=04%7C01%7Cpeng.fan%40n
> > xp.com%7
> > >
> > C18c2709725e14cbab54408d8e24c6492%7C686ea1d3bc2b4c6fa92cd99c5c3
> > 01635%7
> > >
> > C0%7C0%7C637508165016988280%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> > MC4wLjAwMD
> > >
> > AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata
> > =BWGP
> > >
> > gbVtOjOa%2BriGryGp9sh2CSY%2BhMESdGD%2F7LvPJ6w%3D&amp;reserved
> > =0
> > >
> > > V1:
> > >
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatc
> > >
> > hwork.kernel.org%2Fcover%2F11682461%2F&amp;data=04%7C01%7Cpeng.f
> > an%40n
> > >
> > xp.com%7C18c2709725e14cbab54408d8e24c6492%7C686ea1d3bc2b4c6fa9
> > 2cd99c5c
> > >
> > 301635%7C0%7C0%7C637508165016988280%7CUnknown%7CTWFpbGZsb3
> > d8eyJWIjoiMC
> > >
> > 4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&
> > amp;sd
> > >
> > ata=XkGYIxBgrHLwV7R3bro87N6fL7777Wa5rOAZdVjCoZs%3D&amp;reserved
> > =0
> > >
> > > This patchset is to support i.MX8MQ/M coproc.
> > > The early boot feature was dropped to make the patchset small in V2.
> > >
> > > Since i.MX specific TCM memory requirement, add elf platform hook.
> > > Several patches have got reviewed by Oleksij and Mathieu in v1.
> > >
> > >
> > > Peng Fan (10):
> > >   dt-bindings: remoteproc: convert imx rproc bindings to json-schema
> > >   dt-bindings: remoteproc: imx_rproc: add i.MX8MQ/M support
> > >   remoteproc: introduce is_iomem to rproc_mem_entry
> > >   remoteproc: add is_iomem to da_to_va
> > >   remoteproc: imx_rproc: correct err message
> > >   remoteproc: imx_rproc: use devm_ioremap
> > >   remoteproc: imx_rproc: add i.MX specific parse fw hook
> > >   remoteproc: imx_rproc: support i.MX8MQ/M
> > >   remoteproc: imx_rproc: ignore mapping vdev regions
> > >   remoteproc: imx_proc: enable virtio/mailbox
> > >
> > >  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  90 ++++++
> > >  .../bindings/remoteproc/imx-rproc.txt         |  33 ---
> > >  drivers/remoteproc/Kconfig                    |   6 +-
> > >  drivers/remoteproc/imx_rproc.c                | 262
> > +++++++++++++++++-
> > >  drivers/remoteproc/ingenic_rproc.c            |   2 +-
> > >  drivers/remoteproc/keystone_remoteproc.c      |   2 +-
> > >  drivers/remoteproc/mtk_scp.c                  |   6 +-
> > >  drivers/remoteproc/omap_remoteproc.c          |   2 +-
> > >  drivers/remoteproc/pru_rproc.c                |   2 +-
> > >  drivers/remoteproc/qcom_q6v5_adsp.c           |   2 +-
> > >  drivers/remoteproc/qcom_q6v5_pas.c            |   2 +-
> > >  drivers/remoteproc/qcom_q6v5_wcss.c           |   2 +-
> > >  drivers/remoteproc/qcom_wcnss.c               |   2 +-
> > >  drivers/remoteproc/remoteproc_core.c          |   7 +-
> > >  drivers/remoteproc/remoteproc_coredump.c      |   8 +-
> > >  drivers/remoteproc/remoteproc_debugfs.c       |   2 +-
> > >  drivers/remoteproc/remoteproc_elf_loader.c    |  21 +-
> > >  drivers/remoteproc/remoteproc_internal.h      |   2 +-
> > >  drivers/remoteproc/st_slim_rproc.c            |   2 +-
> > >  drivers/remoteproc/ti_k3_dsp_remoteproc.c     |   2 +-
> > >  drivers/remoteproc/ti_k3_r5_remoteproc.c      |   2 +-
> > >  drivers/remoteproc/wkup_m3_rproc.c            |   2 +-
> > >  include/linux/remoteproc.h                    |   4 +-
> > >  23 files changed, 393 insertions(+), 72 deletions(-)  create mode
> > > 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > >  delete mode 100644
> > > Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> > >
> > > --
> > > 2.30.0
> > >
