Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC5A3FFFB8
	for <linux-remoteproc@vger.kernel.org>; Fri, 26 Jun 2026 17:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782493564; cv=none; b=SLeFIfdxPUXC9GNTPLylqYWOXxPVSTysug80PkLsox4dYRdFIEGEXyqZlAt4he+phrYyFGWYw9ChCi9ZOTvEWOd03a/NVyiUHrQaIjncozhZRrtOvWN+ZDYCwW32o/HS3uFwoqSE9RCXE5awNAO/ivaWadpbrKOIonu9VFkt4o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782493564; c=relaxed/simple;
	bh=GQKFAfjK37kURb8eXgj/bP3eu1MfUrZ2X80i3UfUWBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2y1jZT6v8sta7bvJeMfIjhkk+jNtV9jgPNLgXIKqs88ApRCVEPJuSRe79hQTusrGBcpU4nvHTKVAoR8g38kygzgOL0VuevjfqMIQrWr7DCp2n+477jv/sPw0CeHOCI2EZykM3qa6uSIa47C596tsQI3MwXSwPtvxdM3vZD6hRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfGGy3dD; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfGGy3dD"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4926046fbc5so13851445e9.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 26 Jun 2026 10:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782493559; x=1783098359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ctcxDsWWE5CsrZTwx1xGnbf39A7pUyPEOclo5R2hslQ=;
        b=PfGGy3dDJntvUAhwdN74MoQyZ7Kb76WVRvfiYiz1r1uk3V/wjmc0ccylG8JVhL0+aO
         9WSY+r+SENhfxJL8CUeOB1pmR59D9qbmsIm0QL0geqEQ3IJNFp5Fq7qrY/5fyGWdsqG0
         nIyYMLaVYge3kigQjmdxvMGDVbUqMNI+4R/I6uQ1sMOrczr5lwCRWg+mi2S0BVuQYDKL
         dDgqcqfyH8rsZo98a4Dkff0WHyw9Af1jwt2qhjUEWTtw3ws3bdrW5rBD3IoBPhrQQzZE
         8/ce3DSxR7gM6HlnWvwnjDorWuEU3FMzRK5nbfmPEGSUPopV0SrDeRoc0yqUq7qQ+8gO
         PhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782493559; x=1783098359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctcxDsWWE5CsrZTwx1xGnbf39A7pUyPEOclo5R2hslQ=;
        b=LG9rb08EsuGpJF5s18aCDBGo7rnkgLnyYOU6iZzjpv6tTHtKnpE5oPL0Xla/O99xsX
         ScsWeyuhQiZw49M55R7wEqXHpYr1QOe8OBw/qX0HkYp/chRV/oQ2QzPAWWaoswZPfNwI
         QZ/NhzubFYk2mt8jd7bD5aQtqrHMftlVyFn/BcFAzw7DPaB7vHTV5lOC7HuYpgafgnZ9
         uBA0HcW0wMNSRT90En17oIEvDNvweCvBvY/LhCmCcWOksroWnQ56WCkKylncrJ3Gr270
         91Y0DSdMCrYc93fOhxoY5wSwK6dy+GsecfAP78zRfN3xYY77scv+4Qvvq8GgWgyV9Eex
         /OcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5j8w7W9qGuFhSr4z8pbs1yv/ZD2ZzorRKxEXnwSqRuQfbw0HEMMIxOasypsoHs9SymXWTuWuKoEJW0w6ktGzQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyIp910p50BCmydkcldSbzqCgGmR/npDz21W1sToNnUCT5V/I5O
	zbaaGW7A9Oy72oV27shnOlJxrWrK4J9cQYdeOMBWZnZUnX8KT3o1w9oO
X-Gm-Gg: AfdE7cnc4/sqROE/rQUuadcgDD+ngE1fJIkQq3JLhfYmA7Ueqz4sC91NUXy1+Ca2M2s
	degLCQiA62OLaIr34lmx13V7nPD8QB/DN1oqj9SUzTI+9EftQL5oYidir1MslxoA+xHxEPCyLdz
	DZadWUt4sICjpJaRpOF/xE0BOMwWDcTyN65d6vV5UYCcOqqzTrUGKve1hp2CBc7A+4quXH6yhgq
	0WABphzGgYOVyl4vund2pCu31EvjU1xIwUOs21iVYoOeL3P4nQEtGNgp9Fzt1mS+4e+MpROms+y
	b858jvh8U+JlAQ/5AHuy7m+6+TZWGs5TvvkDxypVivEdCsGUICvAJ42aFZGrr4O/PQzb+bZPTWp
	IdqAJcFDzXy4N8Dn8fSrHK5pQUDj2Dw0q2qkdWM106nib9JyCo9Ku8hZi/fGGAfavH6K9fQY+aG
	osUWE6i4VZiMtmtLHM5HfPEgnNdlECqP90FCLo741AB1nJU0KKE7LXXW0Zur0gGUlaTzkKsHdO/
	Dl9o1Le
X-Received: by 2002:a05:600d:864a:20b0:492:5bf9:d149 with SMTP id 5b1f17b1804b1-4925bf9d18amr186215685e9.5.1782493559068;
        Fri, 26 Jun 2026 10:05:59 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46fe25429d5sm1694876f8f.7.2026.06.26.10.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 10:05:57 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <ac8c92cb-21f2-4274-8fe6-f771fe48eec7@gmail.com>
Date: Fri, 26 Jun 2026 18:05:54 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/14] firmware: qcom_scm: Migrate to generic PAS
 service
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
 akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, vikash.garodia@oss.qualcomm.com, bod@kernel.org,
 mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jjohnson@kernel.org, mathieu.poirier@linaro.org,
 trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
 pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
 tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
 srinivas.kandagatla@oss.qualcomm.com, amirreza.zarrabi@oss.qualcomm.com,
 jens.wiklander@linaro.org, op-tee@lists.trustedfirmware.org,
 apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
 linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Harshal Dev <harshal.dev@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-3-sumit.garg@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260626133440.692849-3-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sumit,

On 6/26/26 14:34, Sumit Garg wrote:

>  config QCOM_SCM
> +	tristate "Qualcomm PAS SCM interface driver"
> +	select QCOM_PAS
>  	select QCOM_TZMEM
> -	tristate
I think QCOM_SCM is missing a 'select IRQ_DOMAIN'. Right now I get a
build error without it:

drivers/firmware/qcom/qcom_scm.c: In function ‘qcom_scm_get_waitq_irq’:
  drivers/firmware/qcom/qcom_scm.c:2512:16: error: implicit declaration
of function ‘irq_create_fwspec_mapping’; did you mean
‘irq_create_of_mapping’? [-Wimplicit-function-declaration]
   2512 |         return irq_create_fwspec_mapping(&fwspec);
        |                ^~~~~~~~~~~~~~~~~~~~~~~~~
        |                irq_create_of_mapping

- Julian Braha
