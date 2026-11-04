Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810674;
	b=Oja4W5YzxUuO9AhWJrBXhxxaHdhNBBBLYJvTMO/2EbyYLKQ6f75+CzoLqKhFTcwpHib4
	 woyDHnJ47fvUZGHP9u/4v01dyZD44u5k3u9dkCadjQ04uS6kkRhmpl8nPn3y9808LJVa0
	 ZnWCrAczEbKjdYgJqO8NG8fhr77xyFe4+Z2D0Zu7Pen4IjkHSoR2B5coad5vQqxHPy5ud
	 mA2fzWnDFfqgb9WC7lBUVZXUzDuVtcQa14fWmE9qtOawFfmggeqmEtcOK9hfbOUB33TKx
	 XZI8XhF/nQL2Alk2PQYwmsO/pB1+yc7OzyrZV+ib8Dt2PGTHzj4CeOoWAjvDONJ8emQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=v85/dxSKl2fjZlg4NNDW7kCAXPImgdYEhqBglpB1Uzc=;
	b=X2F1UhFV7frwvaF9K3qBR1y2fG7T+7BGx0hc9G9M+P7/J0lXWujoziavN66zrhopdpRr
	 Mkc56F/O82W1YvsW65KXufcZAe4+ziS+fOUecnsdqf8sE9/pWx3VJB7av9CMnjsLGfhUo
	 iAl8k6CuHfVvrnVmgrIwaeqGvTuFTOKPnJ4kvdtABpwryKpao7JyDd+rv2TJps2zT167R
	 xmsMXFABiTsw/2y5ijKv6Dc7LobYL/Hb01ckSP8gtyPLLH3SsnBI8xdVH8WinEb+qWka9
	 hGC78EX0HmZ27PYK/aHC4DLqi0sBFYejOn4e8fDCq8s7w/TJCkY52TU8QpjDnYq3IEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G8i9hweE;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC17606A31B
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2026 16:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEC17606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G8i9hweE
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ed1414df17so3003205ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2026 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793810673; x=1794415473; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v85/dxSKl2fjZlg4NNDW7kCAXPImgdYEhqBglpB1Uzc=;
        b=G8i9hweEv60CP1G9mcCfOZy9YLt+NuQZcz1tPY8+2SRuWt9vdnKUaG9Nq9MMXDcw4w
         +3+aT7T1be68r8pVWQA/HSrQvgdd5OgkKJFaptkRZTnSOdxs5joe2KoKm3SjiSeI1Lz+
         /iXoeRdVzG2w8WO91j3BAK/2Y84OMDBtXn//32+21JJkMGC43JFetQndQ9l8zLDldcnU
         SSJ/iq3uI1FsuqQCQrnE2Gtltj2Y8X0lBE2R6OI/kvfWiD/yc22K6tlfVfFUveQ9Gbg1
         umtbb0VctW1l3mSnzrIcxdpMsDPMcdSPzkqmZy0/j7kTe3KWLsg+1jkS8EGzCebIuGOT
         bxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810673; x=1794415473;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v85/dxSKl2fjZlg4NNDW7kCAXPImgdYEhqBglpB1Uzc=;
        b=jpJiEEuuZC+2DHm5EX8jMS5400rF3YKw8rZE3FCgEAMETqUmU2Z6NVCpjyva0eoQhv
         /MPX/SNRS5y5Cp3GtZvGN3hj85BADX0SRC7T1LJqL/q71/B4CV8Y6HscPyl5x0LXpuoU
         rT3erbFBHigPoVLrAXAlWg1M20jiBF0TRDsHDDuOddYKfc62dwvxpQCmZFDsNLDmGUkG
         4SYGclaJx6hO4dKIlQFo3WJE5M/g+sXKlhuPnHKQzxKEvqeMLLnsx8Rb3hqbAxiiQYbF
         wR8lYm09Vx8TX4LGIj36hWjEJW1JN9AFjrNycue913tiQPIueGIMfdMqYbYAdHsxpAWE
         V5eA==
X-Forwarded-Encrypted: i=1; AKwUvBzGcJMsnWuw6D++3jSomVkKj7hQfnEZytPq7puqWSY6Cke1zQwoDPh0KuFqFcAGLBElfJ/714NHJNmdpTZa+skp@vger.kernel.org
X-Gm-Message-State: APuU4Z+kZUGHj3OqXN7MM26ecGTaafrfDcmfgX37+POW8SoxnkfmLPEb
	dq+CPICNtMz4GAuof9pMn2ZU4153pwfsD2soU9sC/ST0Y9qFwHjh/cfyxaFbR+p9O3o=
X-Gm-Gg: AYBFou3CUChhj2ai7M2yHGDF2ozMcjvh1bN+AXYjZNZfdm7a02O9dtIpokLgqwOh2qS
	0VueixAlQS9a/+fDn+bA82mkJDGLeWRRCN64QkRyczOAWrAdWKA/PoYnfnFc5g1glOsCuqtm1V6
	m9Zxg1Lt/nTSgxH4hHzK7Wt6Aha0uLIDHgvYNSikrwgsuRilYb4i+/RQCxyPTCFtzEpdLISGsk8
	JWUA/o6GErUoKABBiypGT5910566sXZbEV/85G5teueye4kfPnxJpRWfe6sxv6jo5cbNEE068dr
	gkGKIeBc74WhHvh3yOM39M0Lmazy3Tx7PkVTPyPFupwNDJElBEjA6vP3vn7c34EG8RrDASDlRhK
	S9RAEsuWFo4dvXAlDV3y2fxw9WyTkiBnLQdUydQ2GAryNC/ILRA4CLw9nbfB6Q6WDOuRA9iqa8G
	Txv+fCDU4J7DSsVEinmtve0SoQgQ0HAIVUBnQ3LM4At8lXASuZ1qoXFeVD0lUz3Gfkqqm2yGi/e
	ZkswP2rQZaRkgFKnYMLhvBEBgSrgUJlRgj0rYlQZR56bgHlWq+B2w2N3Va2K4BiyRdO9f5okxhi
	TmqtkavJJPfK/iDd3x8pUc0Y/gZ4/sWUkKQih06c5dPw7aCN63xh
X-Received: by 2002:a17:903:37c7:b0:2e9:cd03:b432 with SMTP id d9443c01a7336-2eb36501f0dmr158595375ad.60.1793810673005;
        Wed, 04 Nov 2026 08:44:33 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:bbc3:cdac:2cd9:7fc5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0910faaasm10192365ad.47.2026.11.04.08.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:44:32 -0800 (PST)
Date: Wed, 4 Nov 2026 10:44:30 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <autg7vGliR7-lH-V@p14s>
References: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
 <15d90126debc21c116c9e862a007afa4d81f704c.1793117996.git.u.kleine-koenig@baylibre.com>
 <auoAZs66RA5OYjJo@p14s>
 <auod0uYPow76TEb8@monoceros>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auod0uYPow76TEb8@monoceros>

On Tue, Nov 03, 2026 at 06:49:59PM +0100, Uwe Kleine-König wrote:
> Hello Mathieu,
> 
> On Tue, Nov 03, 2026 at 09:40:22AM -0600, Mathieu Poirier wrote:
> > On Tue, Oct 27, 2026 at 05:25:20PM +0100, Uwe Kleine-König wrote:
> > > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> > > index da3cddbe7d4c..3c749a39e5da 100644
> > > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > > @@ -227,35 +227,45 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
> > >  			break;
> > >  		}
> > >  
> > > -		/* grab the kernel address for this device address */
> > > -		ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
> > > -		if (!ptr) {
> > > -			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> > > -				memsz);
> > > -			ret = -EINVAL;
> > > -			break;
> > > -		}
> > > +		if (rproc->ops->memcpy_tova) {
> > > +			ret = rproc->ops->memcpy_tova(rproc, da, elf_data + offset, filesz, memsz);
> > > +			if (ret) {
> > > +				dev_err(dev, "Failed to copy segment %d to device address 0x%llx: %pe\n",
> > > +					i, da, ERR_PTR(ret));
> > > +				break;
> > > +			}
> > 
> > I really like your patch, but I'm wondering why you decided to move
> > rproc_da_to_va() in ops->memcpy_tova().  Right now it is called in both path,
> > i.e with and without ops->memcpy_tova().  Wouldn't it be better to
> > unconditionally leave rproc_da_to_va() in rproc_elf_load_segments()?
> 
> The reason is that on ADI's SC846 the memory for the remote processor
> isn't directly accessible by Linux. So there is no virtual address for
> the given device address and thus the implementation of .memcpy_tova()
> on that machine won't use rproc_da_to_va(). 

That is a valid use case - please add something to that effect in the
changelog.

> 
> Best regards
> Uwe


