Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB12C433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Mar 2021 16:09:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7963865210
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Mar 2021 16:09:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbhCHQIc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Mar 2021 11:08:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbhCHQIT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Mar 2021 11:08:19 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164B2C06175F
        for <linux-remoteproc@vger.kernel.org>; Mon,  8 Mar 2021 08:08:19 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id p21so6685193pgl.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 Mar 2021 08:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lobtpJCpR9+X4zgUOnSRpUZhfHE1c0u3syRtwhM3EVQ=;
        b=ImYHvTKi3PHy2BgVft3aje9oZSfDXGjYp0D+XteiFcjnsHN+2x4otZclz2toE9yohQ
         GoDlhDTe4hCetTzuunEEX7j1t1pQwEbuQOkSzhZm0E0G65DsZ1KQpSpapHpCJ7Cv1YO7
         yRcdjlV7DnGVonKC0kL6IoM2jBaqRjJYlm9AYX0BibicWEsyJ3XbxT107qzeJ9TcdoXd
         AV4Dit6sLOTRp2LDDo2HB5htuAoyd2gBZ9hNeIQGAt39mWfbW38F89iLK+PGjj8PNVhw
         cHGibRWRzlohe5agPfADi4MkdwDICoOaN2TVgzSzriatQUqkn1c07iugkCuPgM/MMHcp
         1dHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lobtpJCpR9+X4zgUOnSRpUZhfHE1c0u3syRtwhM3EVQ=;
        b=VD3G30E9U6Wmyi/9NMYHHL+amR5g4YWMPRvz1CyuiwSxYn+n/tmDXHd3M/se+p2yYK
         /W4GrxBGhduHS5yLYph3UNSH5GFLzZmjEyfE4vs0+59erXeN7fR9r2XitCgRO8QHX4k3
         sDqu+9cmX/Sp9V1eLgAtY45NxNuQI/hiuCXu9+a0crGN3OEiJXEHYqGr0+jBrtjLr/Vl
         +tSPs0tOxH5SUnw116LlvbxbmPefXJPpwpZrbhok+znZtxKe/ai9drhdywgu4xkt0C1d
         BXF9Jc/cKfIBvKy3VBpkuJaTCujMND3rYCmHC8m3CPGDrV+f35iQgVnGwh/HAdpiwG8A
         xX0A==
X-Gm-Message-State: AOAM531rLPNxTm690TcdoKXTKrzTsPLQWCtnr2hHmuq60WoG0H0taKmS
        Tg9blToyLb7bX7nyavJtEjI7eg==
X-Google-Smtp-Source: ABdhPJyIK0+MeeLoCL/a77iQoCc0XuYCgkv7q5q2xO16I6AxBYiH/ujFOfyJWHujcLxV4HhtuQ3iIA==
X-Received: by 2002:a63:f415:: with SMTP id g21mr2748127pgi.227.1615219698439;
        Mon, 08 Mar 2021 08:08:18 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id k5sm11622622pjl.50.2021.03.08.08.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 08:08:17 -0800 (PST)
Date:   Mon, 8 Mar 2021 09:08:15 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V13 00/10] remoteproc: imx_rproc: support iMX8MQ/M
Message-ID: <20210308160815.GB3977653@xps15>
References: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, Mar 06, 2021 at 07:24:15PM +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> V13:
>  Add R-b tag from Rob for patch 1.
>  Drop the reserved memory node from patch 2 per Rob's comment.
>  Mathieu, Bjorn
>   Only patch 2 not have R-b/A-b tag, but since Rob's only has a minor comment, and
>   addressed in this version, is it ok for you take into remoteproc next branch?
>   Thanks.

As much as I want to, there is no way to move forward without an acknowledgement
from Rob.

> 
> V12:
>  Add maxItems to avoid dt_bindings_check fail
>  Rebased on top of linux-next
> 
> V11:
>  Per Rob's comments, fix memory-region in patch 1/10
>  Rebased on top of Linux-next
> 
> V10:
>  Per Rob's comments, fix patch 1/10
> 
> V9:
>  Per Mathieu's comments,
>    update the tile of yaml in patch 2/10
>    update the Kconfig and MODULE_DESCRIPTION, I merge this change in patch 8/10,
>    since this is a minor change, I still keep Mathieu's R-b tag. If any objection, I could remove.
>    Add R-b tag in Patch 10/10
> 
>  Rob, please help review patch 1/10 and 2/10
> 
> V8:
>  Address sparse warning in patch 4/10 reported by kernel test robot
> 
> V7:
>  Add R-b tag from Mathieu
>  vdevbuffer->vdev0buffer in patch 1/10, 7/10
>  correct err msg and shutdown seq per Mathieu's comments in patch 10/10
>  Hope this version is ok to be merged.
>  
> V6:
>  Add R-b tag from Mathieu
>  Convert imx-rproc.txt to yaml and add dt-bindings support for i.MX8MQ/M, patch 1/10 2/10
>  No other changes.
> 
> V5:
>  Apply on Linux next
>  Add V5 subject prefix
>  Add R-b tag from Bjorn for 1/8, 2/8, 3/8
>  https://patchwork.kernel.org/project/linux-remoteproc/cover/20201229033019.25899-1-peng.fan@nxp.com/
> 
> V4:
>  According to Bjorn's comments, add is_iomem for da to va usage
>  1/8, 2/8 is new patch
>  3/8, follow Bjorn's comments to correct/update the err msg.
>  6/8, new patch
>  8/8, use dev_err_probe to simplify code, use queue_work instead schedule_delayed_work
> 
> V3:
>  Since I was quite busy in the past days, V3 is late
>  Rebased on Linux-next
>  Add R-b tags
>  1/7: Add R-b tag of Mathieu, add comments
>  4/7: Typo fix
>  5/7: Add R-b tag of Mathieu, drop index Per Mathieu's comments
>  6/7: Add R-b tag of Mathieu
>  7/7: Add comment for vqid << 16, drop unneeded timeout settings of mailbox
>       Use queue_work instead of schedule_delayed_work
>       free mbox channels when remove
>  https://lkml.org/lkml/2020/12/4/82
> 
> V2:
>  Rebased on linux-next
>  Dropped early boot feature to make patchset simple.
>  Drop rsc-da
>  https://patchwork.kernel.org/project/linux-remoteproc/cover/20200927064131.24101-1-peng.fan@nxp.com/
> 
> V1:
>  https://patchwork.kernel.org/cover/11682461/
> 
> This patchset is to support i.MX8MQ/M coproc.
> The early boot feature was dropped to make the patchset small in V2.
> 
> Since i.MX specific TCM memory requirement, add elf platform hook.
> Several patches have got reviewed by Oleksij and Mathieu in v1.
> 
> 
> Peng Fan (10):
>   dt-bindings: remoteproc: convert imx rproc bindings to json-schema
>   dt-bindings: remoteproc: imx_rproc: add i.MX8MQ/M support
>   remoteproc: introduce is_iomem to rproc_mem_entry
>   remoteproc: add is_iomem to da_to_va
>   remoteproc: imx_rproc: correct err message
>   remoteproc: imx_rproc: use devm_ioremap
>   remoteproc: imx_rproc: add i.MX specific parse fw hook
>   remoteproc: imx_rproc: support i.MX8MQ/M
>   remoteproc: imx_rproc: ignore mapping vdev regions
>   remoteproc: imx_proc: enable virtio/mailbox
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  90 ++++++
>  .../bindings/remoteproc/imx-rproc.txt         |  33 ---
>  drivers/remoteproc/Kconfig                    |   6 +-
>  drivers/remoteproc/imx_rproc.c                | 262 +++++++++++++++++-
>  drivers/remoteproc/ingenic_rproc.c            |   2 +-
>  drivers/remoteproc/keystone_remoteproc.c      |   2 +-
>  drivers/remoteproc/mtk_scp.c                  |   6 +-
>  drivers/remoteproc/omap_remoteproc.c          |   2 +-
>  drivers/remoteproc/pru_rproc.c                |   2 +-
>  drivers/remoteproc/qcom_q6v5_adsp.c           |   2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c            |   2 +-
>  drivers/remoteproc/qcom_q6v5_wcss.c           |   2 +-
>  drivers/remoteproc/qcom_wcnss.c               |   2 +-
>  drivers/remoteproc/remoteproc_core.c          |   7 +-
>  drivers/remoteproc/remoteproc_coredump.c      |   8 +-
>  drivers/remoteproc/remoteproc_debugfs.c       |   2 +-
>  drivers/remoteproc/remoteproc_elf_loader.c    |  21 +-
>  drivers/remoteproc/remoteproc_internal.h      |   2 +-
>  drivers/remoteproc/st_slim_rproc.c            |   2 +-
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c     |   2 +-
>  drivers/remoteproc/ti_k3_r5_remoteproc.c      |   2 +-
>  drivers/remoteproc/wkup_m3_rproc.c            |   2 +-
>  include/linux/remoteproc.h                    |   4 +-
>  23 files changed, 393 insertions(+), 72 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> 
> -- 
> 2.30.0
> 
