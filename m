Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47400C4332F
	for <linux-remoteproc@archiver.kernel.org>; Fri,  2 Dec 2022 17:34:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233755AbiLBReI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 2 Dec 2022 12:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232519AbiLBReH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 2 Dec 2022 12:34:07 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E91D8278
        for <linux-remoteproc@vger.kernel.org>; Fri,  2 Dec 2022 09:34:06 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id t17so5560452pjo.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 02 Dec 2022 09:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F+kDg8pnWdhoODSlyXLFl4q13rSFl5u7bcQ2rY8pPSM=;
        b=zihOs8S5OCorLfBIe7Wt2eOMRU2pH7z/KAphL0+cbozyh2yOF17tElnk8yjngPladw
         SMePyNt3gpvbImsB9jwJmbsaJNbrFPnoIO0Oa2JTK3MiFHMn9la1S7fxsKTA6A8D3s8M
         oL/6P0kb98Av/vmEin9K/vLAcj0a84WrYn/ooeplLtjyiR903xiO20jnXqBAGfyDIhFP
         oSubiZ3dMSJEEdO5mU8GMQ2iWsDcI+EsW2IwaY04CsDhssBx8nvNjbVFqPtAaMEOApZ+
         ymercCfWK6M0uyXmvYCcJwMAekcn7NhXmzq4xJ520RDSJCTshDN9ubxfH69ZhiFrVonF
         XkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F+kDg8pnWdhoODSlyXLFl4q13rSFl5u7bcQ2rY8pPSM=;
        b=bPF6woTlSvCKn4DgMg6+RkYS93DQ0OEFWgt1TdPnZdKh1fzsacvs4Rx0djc9HZQRKH
         jgUsWsDFfimN0kytRFv25B81GiYMWFssJDTITTsNpRp58UyZNZfOGBdI2pQEeEuZCCcp
         OKX8ibZ8DoR2ezJaY7z01lURT+eNCV08ZWA2TJQCAh7pKJrufIIRLoK353otNGnwMSRx
         MxBGGp5JsxsTtKtKi4jAEImpQhIr4YG9lyYnJz6t88TiIg2c4I8U0TCK0lyEnYJYH4g0
         7F0iNoNo68viINrtFEu9WaKzm+BUxfPOKCHQE+U0W4PQ8w9uMYZWoVigCp//CJz2w1Ql
         mu7A==
X-Gm-Message-State: ANoB5pksoi2275i7QoybC3DRQHFu4W7S/4jr9GmYuX4Mg2csbRGVhy1z
        A9iWF8nN7sgeseBHCDSNemIC+Q==
X-Google-Smtp-Source: AA0mqf6qZcbm7VUYRyQFw0Z6xbzMhDHL56+CN8g5owHqH4MnNNy2tRnvQxZ62Jm9c5yWb1iW8Juk6g==
X-Received: by 2002:a17:902:8503:b0:178:4f50:673e with SMTP id bj3-20020a170902850300b001784f50673emr54304417plb.126.1670002446227;
        Fri, 02 Dec 2022 09:34:06 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:a85e:8886:e9cb:3b71])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902650400b00176dc67df44sm5850373plk.132.2022.12.02.09.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 09:34:05 -0800 (PST)
Date:   Fri, 2 Dec 2022 10:34:03 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Maria Yu <quic_aiquny@quicinc.com>
Cc:     arnaud.pouliquen@foss.st.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, quic_clew@quicinc.com
Subject: Re: [PATCH v5 2/2] remoteproc: core: change to ordered workqueue for
 crash handler
Message-ID: <20221202173403.GD165812@p14s>
References: <20221202094532.2925-1-quic_aiquny@quicinc.com>
 <20221202094532.2925-3-quic_aiquny@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221202094532.2925-3-quic_aiquny@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Dec 02, 2022 at 05:45:32PM +0800, Maria Yu wrote:
> Only the first detected crash needed to be handled, so change
> to ordered workqueue to avoid unnecessary multi active work at
> the same time. This will reduce the pm_relax unnecessary concurrency.
> 
> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c2d0af048c69..4b973eea10bb 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2728,8 +2728,8 @@ static void __exit rproc_exit_panic(void)
>  
>  static int __init remoteproc_init(void)
>  {
> -	rproc_recovery_wq = alloc_workqueue("rproc_recovery_wq",
> -						WQ_UNBOUND | WQ_FREEZABLE, 0);
> +	rproc_recovery_wq = alloc_ordered_workqueue("rproc_recovery_wq",
> +						WQ_FREEZABLE, 0);

There is an indentation issue with the second line and this patch doesn't
compile:

  CC      drivers/remoteproc/imx_dsp_rproc.o
  AR      drivers/hwspinlock/built-in.a
In file included from /home/mpoirier/work/remoteproc/kernel-review/include/linux/rhashtable-types.h:15,
                 from /home/mpoirier/work/remoteproc/kernel-review/include/linux/ipc.h:7,
                 from /home/mpoirier/work/remoteproc/kernel-review/include/uapi/linux/sem.h:5,
                 from /home/mpoirier/work/remoteproc/kernel-review/include/linux/sem.h:5,
                 from /home/mpoirier/work/remoteproc/kernel-review/include/linux/sched.h:15,
                 from /home/mpoirier/work/remoteproc/kernel-review/include/linux/delay.h:23,
                 from /home/mpoirier/work/remoteproc/kernel-review/drivers/remoteproc/remoteproc_core.c:19:
/home/mpoirier/work/remoteproc/kernel-review/drivers/remoteproc/remoteproc_core.c: In function ‘remoteproc_init’:
/home/mpoirier/work/remoteproc/kernel-review/drivers/remoteproc/remoteproc_core.c:2738:46: warning: too many arguments for format [-Wformat-extra-args]
 2738 |  rproc_recovery_wq = alloc_ordered_workqueue("rproc_recovery_wq",
      |                                              ^~~~~~~~~~~~~~~~~~~
/home/mpoirier/work/remoteproc/kernel-review/include/linux/workqueue.h:419:18: note: in definition of macro ‘alloc_ordered_workqueue’
  419 |  alloc_workqueue(fmt, WQ_UNBOUND | __WQ_ORDERED |  \
      |                  ^~~

Last but not least, please use the get_maintainer.pl script to make sure the
right people are CC'ed on your patchsets.

Thanks,
Mathieu

>  	if (!rproc_recovery_wq) {
>  		pr_err("remoteproc: creation of rproc_recovery_wq failed\n");
>  		return -ENOMEM;
> -- 
> 2.17.1
> 
