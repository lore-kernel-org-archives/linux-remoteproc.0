Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A77B13633B
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Sep 2024 16:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725898042; cv=none; b=KFUTFT9omXTJpXjS1cPdrW/RqumYWaqwGLeU7k3G7POckl9ie8Gn9eKVWPLpMCRCZpHCmox9KYzr5DEN2WPHolRe3l0ycK61BQPfzJk2qBRr8ODw//UO9L10W+OEe8s92o/TSrCGay1dlIundS5BIs/L4tX9ztflId9hSE2ABng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725898042; c=relaxed/simple;
	bh=rgWHF1GwoDc5gsIC7qehHHFotpj0UsW9NwaHAWNsJzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sjLvQX1q3mMHB+aYuKAYdiBk79hHao/zw1WekLLxKCAjNFhKiejm2y1f5JxvgiW/pIWiKv7vviUyNSTip3YgqVieaLucziFAVcEBJE10GcMq50WIss7RKiDUp7X9sVXscJKewcLSTdpYvFdxmsKnWl1zGljYlltnbp+/JU+EMQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VBOmkUYH; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VBOmkUYH"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c241feb80dso10722805a12.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Sep 2024 09:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725898038; x=1726502838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28S6UrFU43fhJX4Nty5L19JOVvgzmo+llZoOvG8pYkQ=;
        b=VBOmkUYHEAP7K8PnCXlCoS/9No2o7SF2Caedvkq87jtI5gQsJQCkYaxsUwLY98ygFe
         C+VEnhVUwV7obkafKzSWbeMeqSYQ5J3bcGAlHgWnO+rhMhFQC9RBuGbMKr4MmxDJEIPy
         1/OA3xF/cI8ldWG/XXbGV8Pjp93PmpcIzE0B2LC60d4yYwP8mqJDn1iXlOy6nfkdz/wR
         K7ov+6cPxTwC7UT75BDShdBaosCZMAH4UBEWJAnHQGklHrZvFM9DLNz1aBdgb96rTK0L
         tzevKE5nxZc6YqHW7ijgBApha/jI6fUUyFWPMIOHj4HbJWWBB9dsJz8bgm9yVneHfDCY
         /rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725898038; x=1726502838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28S6UrFU43fhJX4Nty5L19JOVvgzmo+llZoOvG8pYkQ=;
        b=Px4L6xAZ94OeQHVr+Fz/K1Ri/PoTB44S4Ud/iChL2+ziLRizxXWVbagYuxTnhnR6vl
         9N35j7FruIeBopSXKQh1aaENtTpq4pmbCMFclH0V7UkIssjyE6/KK+aPZXj5vWGdziN8
         ro3Ozw6sMSZw9TMST+SJrPsklN2eVFmugATe4Q8ZjxJaHLSjHnY7gEnQRADBQR4Pw/Wd
         3fwnPWXCybeAHQGjtYntNLjeEYCuT9S6FyrARzbMq8BH9x5qK01FMOyLfZLW694E/WHe
         s4b+KOzaV90pRui7eD8r1l3cAV6bKyIzYpZOYvsNzDPn3oZb62IX30KkOncI4kElz7Vf
         5/Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVbqba/NDterq8ueC+HOBfZ6p1k+B4AWKqbT91ZUJ8Tz/rasPSKxkhW9giQ2S9Er+ECW3fUKjaFOBYtVsvGfWnr@vger.kernel.org
X-Gm-Message-State: AOJu0YwNaZAhoZzMuVLYEmBx7wIIXEEVyspX2S2oECY5DH1iT9QsEOI2
	Ihku6tWeUx5WA5TWV7Jav2CrKqf4bPjt+kkqMQynKdu8Ctk46YHNjGEGMsFhI8USCEePDbvr6pq
	uKn8UGAyJUKU2/4hd8TYFCAN+PDvERgb3vyR6n2v84ZonwuvV
X-Google-Smtp-Source: AGHT+IF1PKlT/lhkKRnR9lgc1OJVvfieBiKtd466ImQTH4ob7Pb9877uUUxL0+tOim0yZB1TIE6whfzXPL0ErBTFo6o=
X-Received: by 2002:a05:6402:2317:b0:5c2:7601:a0c8 with SMTP id
 4fb4d7f45d1cf-5c401602356mr159116a12.13.1725898038233; Mon, 09 Sep 2024
 09:07:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906113405.92782-1-zhangzekun11@huawei.com>
 <20240906113405.92782-4-zhangzekun11@huawei.com> <ZtsnMHHYA9zlFdDH@p14s> <819d4d8b-d72f-42c4-95c1-f10a1e87c8b6@huawei.com>
In-Reply-To: <819d4d8b-d72f-42c4-95c1-f10a1e87c8b6@huawei.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 9 Sep 2024 10:07:05 -0600
Message-ID: <CANLsYkxhR7+9a5stFdsKYK=TMxdwOhQsiyMCL32eSid20m3n0Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteporc: ingenic: Simplify with devm_platform_ioremap_resource_byname()
To: "zhangzekun (A)" <zhangzekun11@huawei.com>
Cc: patrice.chotard@foss.st.com, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, chenjun102@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Sept 2024 at 21:00, zhangzekun (A) <zhangzekun11@huawei.com> wrot=
e:
>
>
>
> =E5=9C=A8 2024/9/7 0:00, Mathieu Poirier =E5=86=99=E9=81=93:
> >
> > You still have missed several instances.  I am dropping this set.
> >
> Hi, Mathieu,
>
> I have checked the subsystem again and does not find the missing
> instances that can make such conversion.
>
> Instance like this would require storing the resource size or the
> res->start, so we can not conversion likt that:
>
> ------------------------code start---------------------------------
> da8xx_remoteproc.c:
>
> res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
>                                     mem_names[i]);
> drproc->mem[i].cpu_addr =3D devm_ioremap_resource(dev, res);
> if (IS_ERR(drproc->mem[i].cpu_addr)) {
>          dev_err(dev, "failed to parse and map %s memory\n",
>                  mem_names[i]);
>          return PTR_ERR(drproc->mem[i].cpu_addr);
> }
> drproc->mem[i].bus_addr =3D res->start;
> drproc->mem[i].dev_addr =3D
>                  res->start & DA8XX_RPROC_LOCAL_ADDRESS_MASK;
> drproc->mem[i].size =3D resource_size(res);
>
> ------------------------------------------------------------------
>
> I have thought about adding a
> devm_platform_get_and_ioremap_resource_byname() to make conversion for
> these instances, but the function name seems to be too long...
>
>
> For other instance like below, we will have code logic broken, because
> devm_platform_ioremap_resource_byname() will return error if res is NULL:
>
> ---------------------------code start------------------------------
> mtk_scp.c:
>
>   /* l1tcm is an optional memory region */
>   res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
>   if (res) {
>           scp_cluster->l1tcm_base =3D devm_ioremap_resource(dev, res);
>           if (IS_ERR(scp_cluster->l1tcm_base))
>                   return dev_err_probe(dev,
> PTR_ERR(scp_cluster->l1tcm_base),
>                                        "Failed to map l1tcm memory\n");
>
>           scp_cluster->l1tcm_size =3D resource_size(res);
>           scp_cluster->l1tcm_phys =3D res->start;
>   }
> -------------------------------------------------------------------
>

I see your point and I applied your patches.

Thanks,
Mathieu
