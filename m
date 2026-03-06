Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF432352926
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Mar 2026 17:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772818516; cv=none; b=GoRiQdW3RzAKLEhe+Xi0fwRaUWEsbO4xnfnhbehvhnI+IasMk5LyO7xVDl4MSGecIvp8v+NUD2DU9duF6L0WUc4p9nYNsmDUNmxe5+Kp+aQ6AxZ3WhgK8E1Jbh5CYf+v0eF8D53IOMkAlg1VBOp4umvKfax7GS7l9kKDj3S8ZfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772818516; c=relaxed/simple;
	bh=fzatlw/sCgbsp4Zu7cdwZDd8/5isaVX+doRyzZoCul0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0GNjvxI1to0Uevtx1NCw+BE/PTS6XTEc2+UmJwCh3ilzZu/XUb9Ta5srVVFLcs/R5RdIsfTGn2gydkHZCk1KZYWQIyFkFNVd3octeqxN9U5sbx13EHThtKnM2MTNwkXqnd/qfg/D3DQmRZZM/GRGQkAfogNDCCAWMX7v5iCZtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HMapg1Y8; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HMapg1Y8"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ae8177446fso7127075ad.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Mar 2026 09:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772818514; x=1773423314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eTcvKh0v+GT0/XHMN8tpZZrh9YCPVH8ZIPfysGX7h7c=;
        b=HMapg1Y8yXhsMQITWuju0F8lmHSGlqQo+O6r5FhdozvzD5vOe+u+JzWgdfrpxMO70R
         5710+R6Wap1Qj4xlran6074QgaFbg9Sm659spKPXdOLpN3kJjOwrlNKJKk5qsNm6WF6m
         kKdJp9Kkyx7bOD7R+GCGg6w1rnBzNVp107xIKnGQfUHsNy+mAlXWxH7USjXE5yRobTJL
         0Pl8KAlBnyVJAw10WDbjh8ey7xYzFI9+b1AoYcRU2TGayCvx0GDNiftmWfGvVTmtbOHL
         EJNEIOJGOnc7tXrNXZZ/HNK8+/EEwpsCikmqux3xA8HuioEzhpBKGrqp2ZANJXoWw1KF
         pwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772818514; x=1773423314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTcvKh0v+GT0/XHMN8tpZZrh9YCPVH8ZIPfysGX7h7c=;
        b=tJgD+YAACQUIC2/byzVY/OimLnG6P0DZYpBvHz6Dbvwz6XZ039ch+m1qSgn6xk5KRi
         oeAqK4lppiRk7SxBGszW35KGzCqAqbX8QwF8kYhJNV/jummkVcfZPhfKLZtV/+f1NGo/
         3BoUJQ6LowDrnmt7gIP1aQ9dwZLV8nKymes+HwCQY3lPv5i/WCa3dse0ovUQakS3AKLO
         AA38yNvqXvzDlXb9D2MXtPA/XO6WeoUniBmZ4+vWM+K40Y0oxM0fkMSMvFwtqCzbFNtu
         Jnt91JFPnMHL8iISKP2epoVnyxji1MyFeCkP/Hsv/NtL9axJjZesq7Jl/cSqa9FENdg6
         Uxqg==
X-Forwarded-Encrypted: i=1; AJvYcCWLjj5ISQ2Us5Xam//UA3r6MDq+2h9Juil+Mxts1geLxy1fuD8MP3Yq7x9oyLL35DbD4yL47o9MDlFvQss4ntq4@vger.kernel.org
X-Gm-Message-State: AOJu0YxXYiShA8ELbhoOC7TfOVLVKacMsjxSI61YN2lge2Vs+qp4Dlxe
	JxsTHS4O9PeqldnPr/LB3R6t3dH/IiO1MT7wVAeh3US3/RbkXUMGXvfRLx0SJ2Na5tc=
X-Gm-Gg: ATEYQzyQpu6+dDSrKLL3YzwKQFPVCXJm00Z0/bhQE7k9ypIgxzcvnYdMrsoUP1BLCdb
	xwJe+A3eQ030KvdyuXJRXqSpeQ3+Vu2P92vSyM+J41En1acZMVaHPFJ1b6vd4u42rmwJ/lfMLfT
	i8QQln+puj2Qk4h7e4sk5Rr0rjAC7oBHKmlrMKlR547WtXWNJuT1CMrdDxWjepDiS6M7PLdCQNA
	VyEuDszFXszJ/HGHtCUjs7bOdbipZO6BSodE1+cShNCNT1StNkRA7nR80zoQiJ1rZCpHEOrdjgd
	4yL2D4XZnXsBbRcHaOz29Sle0KO1yxWOiJJi1yX/GTSUunGThSD3Jh6lahs2IY7t8ydn0/oUn+0
	yrBAhV+xD+GA7vQCFDAEJ6wWsiSL0QtVwZjCd6pqyze4DEPpET4AGfuQJRs2+zE4a6H25paUMMQ
	0OhDBII/V49Hzm0K4JFayvuPcwAI8=
X-Received: by 2002:a17:903:2ece:b0:2ad:ba04:40ca with SMTP id d9443c01a7336-2ae8247b5demr28807575ad.25.1772818513931;
        Fri, 06 Mar 2026 09:35:13 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:4b1b:60d0:c217:8ee9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f742a5sm25044815ad.54.2026.03.06.09.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:35:13 -0800 (PST)
Date: Fri, 6 Mar 2026 10:35:10 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: pru: Use rproc_of_parse_firmware() to
 get firmware name
Message-ID: <aasQTtI4mkH9Vd6a@p14s>
References: <20260302202728.322073-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302202728.322073-1-afd@ti.com>

On Mon, Mar 02, 2026 at 02:27:27PM -0600, Andrew Davis wrote:
> There is a helper function to get the firmware name, make use of that.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/remoteproc/pru_rproc.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>

... and this one too.
 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 5e3eb7b86a0e3..19b107d29242d 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -1003,11 +1003,9 @@ static int pru_rproc_probe(struct platform_device *pdev)
>  	if (!data)
>  		return -ENODEV;
>  
> -	ret = of_property_read_string(np, "firmware-name", &fw_name);
> -	if (ret) {
> -		dev_err(dev, "unable to retrieve firmware-name %d\n", ret);
> -		return ret;
> -	}
> +	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "unable to retrieve firmware-name\n");
>  
>  	rproc = devm_rproc_alloc(dev, pdev->name, &pru_rproc_ops, fw_name,
>  				 sizeof(*pru));
> -- 
> 2.39.2
> 
