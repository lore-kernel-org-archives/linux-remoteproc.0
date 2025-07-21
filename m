Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DBA26F454
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Jul 2025 15:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111503; cv=none; b=JAI9ZpZCWrFuewqCWGiD6kCR/OWrtZI4OMenyeugimhpCjWdr0YkdGCW1VkNN4RM5hIE9q7XNcq/eicqMKmySoEs4PgBnY2h87l7hR/r80R6SdjuOUegBqGu5z8qgBjSe+KCNzJU/+BbPKlFIKQpvfaMB2AfoYwqTTyUP+o7HOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111503; c=relaxed/simple;
	bh=0favzC7sjFak+NOmfIdl6eBf4vGYZIG748Kdib+w96s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVRnmzjn/vlFbzmjUFwuMUSz/0qT088fHM15ULbsTCFai8ZCHXu1YIBego1uvv5uRMeeWaDWVLOIHuKuztQsGU8/GOqhVHMNEW/oXEWj/rBzUgipgNK9fi07xiMxc4Bt5FNyFyAyAb3Nf2O2kxAJ5oG9D3o7VGj7t0UWvuBLgA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=taG1IzCd; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="taG1IzCd"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23636167b30so40374655ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Jul 2025 08:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753111501; x=1753716301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7JY0xubH/7CmP764RnN6ToDZYqOUUQxz6pVo9aMZtxs=;
        b=taG1IzCdkUe+TFWhUQF9USFuo1JDps6/NQs2QeI0GDZWtdjuevGjCZxfrF5u/cz0Wq
         yuEepkFM1zJXU/kaNmz8dp9ERfCot4CZYL2UrAvODP9PoUBLX1TWxZcEFME3xVgut9eK
         EHeiF5qwH/xdR2dOsbWkaLIkaqTIgIfKdUD5vkU3l0ORtc6L40AYCPQkN6u/wzR4yWTz
         75cPrnwxn6Up9vG8Dz5RevmMuslRN3pkWKuFuC9UR39ZNzO/hajIBg5oXS6G9c+Ltkr5
         j8vsNVyIqFI4jwjcsJPgKkJTz02wEgBpSY/fq/l1EGcdL6cmimvUGIjpOGz3KaE/ijFk
         mLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753111501; x=1753716301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JY0xubH/7CmP764RnN6ToDZYqOUUQxz6pVo9aMZtxs=;
        b=vAeJdwyNhn/7w0SZes87k/7Wgg616PCo1HlgBqsBaWIBtRPlrZks9OrgbOacktILip
         gLUQhOyYtc96xqiQDKaAq4p8hoFOSEHwkUmtFnNu4gw2tkpCKxwXrC4FmpRHIY4P+1VT
         JznlglRjP7ARuvykCbQxUiy3TXOwhbQJszaCVkXOVw1rIQ/T4NjjvDNzj+x7Ph0NDcd9
         FawoTtZnO72vF5N2K+Lq6F8fk/slmSSB6kv99+L/P51cQbPEBPn17mh3sXc6RJTnNFJo
         1cXwJ1B7ZfkmKP6Dg4tcggD2ruLaf0GmxOYhUFdjN08hYauG4aaIzQpjknGqPYsjrJ6z
         brSw==
X-Forwarded-Encrypted: i=1; AJvYcCXUs+npPDK6E1k9ZaHqCcF8rrZkvMZ9m4AikHgcTqInARIWhgsDhmvKnNw5Sfw7OnxV1ATzmy/dwl2I2qzH8Jvw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1PRGQHVg3MOD5RopevR4LJb+JvlijeQaMlenk56+rVfWudMWH
	JZfSSfN8GWGr1SgFk00lMo6k4qzV+xcAVi7Xy6+/5XK1Tsc4p47XDK2tBdeql/rAwXU=
X-Gm-Gg: ASbGnct4ykNHBmOcWGu8d1+NxO39d4frsrwCsx1uYb8IaUsb5WfThH55f55Eo+i1mAi
	UWRYSC9kMY25hjOnEFdwAyj1zYMFtXIzma1PfUASUpFJJR5+1MIMhdp/4VoXgLMDR3kD6l0HcSp
	xHV6NFKxwjU6nish2CVdEIoAvN7uF2muh66MIrpMPHiYyhNTu1yZb1HUYW6GlJUzwzvGjcgXTpu
	3F+XRRXFNrn+EoJ6rpLDQTzMk8SINZMNIXWCPZdm5YZCON4mx0TTAQVUSg4W68+QYkHa+5tYEIN
	T8s4WZIeZhPmlmjUJAA54f8tD6xwopvQHXOftph9Mbwxey6qB6nxEBua8Iz+mZZB08VST0S6miy
	UTSGiY4tovPJL1iklJfvvKlNCHQ==
X-Google-Smtp-Source: AGHT+IGZMNP1a6kskS6Pcfkl6H+Xt0CgudgU1mmF7mun002WwHrv7ePLTvnhYw/MIEXzvgrCpiiOtg==
X-Received: by 2002:a17:903:166e:b0:235:c9a7:d5f5 with SMTP id d9443c01a7336-23e256adfcfmr234891115ad.13.1753111500845;
        Mon, 21 Jul 2025 08:25:00 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8fb5:9396:b7cf:1f69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e3d4esm59730425ad.23.2025.07.21.08.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 08:25:00 -0700 (PDT)
Date: Mon, 21 Jul 2025 09:24:58 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: xlnx: disable unsupported features
Message-ID: <aH5bynQwaHbCJR3f@p14s>
References: <20250716213048.2316424-1-tanmay.shah@amd.com>
 <20250716213048.2316424-2-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716213048.2316424-2-tanmay.shah@amd.com>

Good morning,

On Wed, Jul 16, 2025 at 02:30:47PM -0700, Tanmay Shah wrote:
> AMD-Xilinx platform driver does not support iommu or recovery mechanism
> yet. Disable both features in platform driver.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index a51523456c6e..0ffd26a47685 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -938,6 +938,8 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  
>  	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
>  
> +	r5_rproc->recovery_disabled = true;

If recovery is not supported, and it is set explicitly here, does it mean the
present upstream code is broken?  And if it is broken, how was this tested in
the first place?

> +	r5_rproc->has_iommu = false;
>  	r5_rproc->auto_boot = false;
>  	r5_core = r5_rproc->priv;
>  	r5_core->dev = cdev;
> -- 
> 2.34.1
> 
