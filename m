Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30875205ADA
	for <linux-remoteproc@vger.kernel.org>; Tue,  1 Apr 2025 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523563; cv=none; b=avX90SmjAmackcnCMSnPT0Y73Xpm42WTDB87LOCEE5W8geR2QIemTU7k3I1hnFBpFfMHBB1loGGjQ0NOTII8XpGwNbgHRMwz2lkvJl4RiaL4VEdGGUR/Hyvim5TIb31B85tusf34XPWi9ZGuAGLTcIQAFSJRTyJbYfLnWH5Bk7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523563; c=relaxed/simple;
	bh=2DTe70VGxuBOt/LP/Qp4+Hu35qgNdvgQcrZCfnEFhzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RYg7A65wCrUcGP+XPKQ8aG0Is/XNzzmDH97jsNMFeptYwkHMX2XWsw1bxRo5h8LjPKgmXthN65O1ym7mfky/cjnx21MEUphArb+NQiFET2UXYJW4OHjS/dMcI3jrrceKjNodE3N8cw4OhVnyYr/1iSpExLpArDtVnyrdTupjZnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BNuJj+9P; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BNuJj+9P"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22403cbb47fso120278025ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 01 Apr 2025 09:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743523560; x=1744128360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AuO3JoiBaWEWl3zVvnUtjCtMgfiv8CYDUp0HTVXRARo=;
        b=BNuJj+9P1NVZ11v9iFbHrbqiT8sWMvNZPY0/L8OuprU1OYtsEdtOjyHpGBVyJbMDPh
         mAPlRBIJ8VrpiWuBuDTI/IuafxC+HDirNqihC0om9hX+MKzmL6apqBPVtd/plxfz23Qm
         D6bpDDc6SUUtIw/uNuQoSJpLgNByTR7PGTnMbYYPPy0/rTp93F2c1+PbEZpU9RP94rkw
         yeS2vu6+y8McsAeQ0ecUY1g/rxvpXoXAaycQlIPlpZlNmARCUoko55R+u/+r1DsxEDJl
         xrpyKUL1S57MaocPGX+IigH1BCS0vIhVnLWGMnMrtOAiMQqTXM4DbHDCpdu1QOGeOJr8
         QZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523560; x=1744128360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuO3JoiBaWEWl3zVvnUtjCtMgfiv8CYDUp0HTVXRARo=;
        b=vvyxd/NjJxwpDt7nNPeCHDb5nZ7FSD+TQEP8PHYxs3oL8fHtF8+fA1VDlXUsqNEMij
         bgK8QF4/F8vNakdfJLdEFzBAMCvEFHsRUcaxoFL1pEGLeujHP9XPbaHYk89icb0FaJOT
         1Vjwi246L4UVEAdm8rIfGHpr+celoVb0lVUPtrhG7ZZdYhLZs/oFIlrLKX9dxDhim8yN
         hA9kGfoIEL5o6FQoB59wIX5gqWuszZFhfuZztej/Q/VJ6L7uTim3lOOby2TxDL7cXJzp
         2jwdA3flkVisk8FteSYDv9VQZc6uPr8tM4jjAN+D8lAQ8plT4r39wnsHWegqAjaGbwlH
         acfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6xIuo8hXnohbbV6mNWw+2A6LWWwpbvxxtpDN7MFjvkWWoQ2LJ9wDPkWWb11jrjWkufZxZn/pA5lSlXhrJiMJj@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxjef+l8jMee3L3G+bMgUeGmI10MvW7F4yNJdgedwlcJHxGnfg
	FiixxSatFCjQxmwKqM+T9JXtdSddNMQGARiUozoEwrZ59jcUmAeU0fd6VXsZa1I=
X-Gm-Gg: ASbGncs5XbjZGjGCQ1PtaONquVSjQXwt+bQhHlDXsebotLedPDGlKPq+6nlqTOYUFjP
	w5rnNZogjfwQuHN0detCFQQ0aPXhZEFN23Img8QRBidoVQoJzTZ6jiAR2Hx8hVCTqOUS2EPiwrk
	qG+tJfZmXAWqXksj2ES7DfyDL4HCMl6zMAjOC77l5REMyuT73TTbsvvAB0kQsMQcEFcG30mbG3y
	CVegRpurK04W4KUm4/T4aJUltOYbI/96VVHyruwE4sP3nPvgfnXSpowOrhNFGWZaMvVcAu4HfSU
	DXqods0kMUiRe9Eze8qJlTr2jMUq3E02aRGA4pxuueeaRcpt
X-Google-Smtp-Source: AGHT+IHS665q9tq8I4Rn8gAFViO1Vbyxy5C1fhneAWy0pBzjbtNJpFCpmq60Cuhz94aODSClJDgSTA==
X-Received: by 2002:a05:6a20:2d0c:b0:1f5:a577:dd24 with SMTP id adf61e73a8af0-2009f645311mr20981139637.25.1743523560465;
        Tue, 01 Apr 2025 09:06:00 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:62bf:3c83:f3df:dc76])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af95d59a786sm5788320a12.53.2025.04.01.09.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:05:59 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:05:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH V2] remoteproc: imx_rproc: Add mutex protection for
 workqueue
Message-ID: <Z-wO5PLU01Nd3QDU@p14s>
References: <20250401140402.3676049-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401140402.3676049-1-peng.fan@oss.nxp.com>

On Tue, Apr 01, 2025 at 10:04:02PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Same as commit 47e6ab07018e ("remoteproc: imx_dsp_rproc: Add mutex
> protection for workqueue") and commit 35bdafda40cc ("remoteproc:
> stm32_rproc: Add mutex protection for workqueue"), imx_rproc driver
> also has similar issue, although no issue reported until now.
> 
> The workqueue may execute late even after remoteproc is stopped or
> stopping, some resources (rpmsg device and endpoint) have been
> released in rproc_stop_subdevices(), then rproc_vq_interrupt()
> accessing these resources will cause kennel dump.
> 
> Call trace:
>  virtqueue_add_split
>  virtqueue_add_inbuf
>  rpmsg_recv_done
>  vring_interrupt
>  rproc_vq_interrupt
>  imx_rproc_vq_work
>  process_one_work
>  worker_thread
>  kthread
>  ret_from_fork
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V2:
>  Add RPROC_ATTACHED check, because i.MX supports remote cores started by
>  bootloader.
>  Update commit and add R-b from Frank
> 
>  drivers/remoteproc/imx_rproc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

NACK - for the reasons I have explained in "[PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown"


> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..4819a9e57543 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/firmware/imx/rsrc.h>
>  #include <linux/arm-smccc.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> @@ -785,6 +786,11 @@ static void imx_rproc_vq_work(struct work_struct *work)
>  					      rproc_work);
>  	struct rproc *rproc = priv->rproc;
>  
> +	guard(mutex)(&rproc->lock);
> +
> +	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED)
> +		return;
> +
>  	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
>  }
>  
> -- 
> 2.37.1
> 
