Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C125813E3E1
	for <linux-remoteproc@vger.kernel.org>; Thu, 27 Jun 2024 11:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719486666; cv=none; b=lByBSinbmmCRvBPAWWdfRW354vxi7OkYbJSLbnMqV3aSYg3MllhdhQZRfgQwVExvJSjQyfdoQsqHmCvBkqN4jPsRTKLa3IQWqkXXmOyy6fCdqOKC4yVUcAxav0cdB9uKPC4VwpIhN2g/E/10xqSTySfuffHJgvScyDyt2SIe+Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719486666; c=relaxed/simple;
	bh=YLQmrm8y/W5mPh+g+lIdFwGDKORoD4GdmpQzNghV7C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TA2d6QKqsDvMeN3+0ueX3ZTDuKjvJq6hyUiZjWsswEjptGFh3X+/D77GxgxKi/NIMMihWedjf3tfwlYmkOeFUujZRYZaUJd6iu0W4ZUOvmOvZMwgOKHmwx824qKHVKRS0+rLoaWInaCFk1MT7PJq34Ek1HfpsXV/JnJuo1Vg9KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vDXML3od; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vDXML3od"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52cd628f21cso7165195e87.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Jun 2024 04:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719486662; x=1720091462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JZfwnwILao9DSqYa7qrxNn8B+UNfyRNRyM9k2v0B2c0=;
        b=vDXML3odhUfbWErKYJnvfT6zGHcrHZuyyayMLsCokDB8ZnvOwfUlXJ3xcC9Icedx/I
         wC8GeLNs6/Hzg+FN5sQSJdSl6CbuX0kSTvkSlTd6VgToAdByusRayKdrc8Am8qHEvrq3
         m4b9824kzzBnuNcpmnxfkE6m2jFgAd2eJYIQTLwC4nV1aaJGjsiRl9Jp8ojSfLvVLlZp
         JDH3sO2xe3Mab2tA+K8hunaYqTxZf4ZNgX3rrfoLNHZzWu72zHfTvL7sNxBwtJY4kZNp
         OD76D9699m5dvty8+7vTZuKjSO54wrpeamV/Xys1Q4FuXoG4GIKYo9sVyeaSCZ+/atKa
         4JIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719486662; x=1720091462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZfwnwILao9DSqYa7qrxNn8B+UNfyRNRyM9k2v0B2c0=;
        b=vQ399tdSYxRi14ZtRfAso0I941o9zYNh3vRQNXIjYP3nfyi82tp2x0kRgdmP7Owy7/
         9OIOoKnZQfPwOysxNEDGd3e6nkwqJqrpwuAdJziPPgPpIZJgTiSPz8UtIBH8rvJ54qVO
         tyhExSGARi1BGLAdnRNTiJM7bi3hFu2y7JoxkeHfRO1DtJOYn51mziOZqxp3wdkIMU2I
         pwU9fdzptSkThSRFJns14tXCNcKIsWteQWcBPmYHHwRDY5/LN2t988Ky2jZwpRr0v2Be
         1DI6SBSOerYteObAqjoMi4EzlOWGso+kpjE7w4NMsf2Rs94Tu3zwUczsomBve3diBOu5
         Q4OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR9n6F7N0xMuNnu22xDhzuVL3xUFiKyjYJ9SvQ3040zf/hpg/KY6JfG0pzBC1GxTIcKi3moKSU91J7OHnNZVVBCf7hsTgBys3k+9yphyV/Qw==
X-Gm-Message-State: AOJu0YzcEiSMTloMr4pj7yjQq0BJ5/y5V/ad5RHdyOQO5Mr/+a36GdiD
	FraHwdDXpY9M4gYA8QfkMPiMhvieOPxiX4xM00d/S8jNZcry1lr/d0q3nVZfy5A=
X-Google-Smtp-Source: AGHT+IHLeNWA6STAmK002F9rrUHbw0peSq+8PW3/5EwME76N2y206FiddtnUjwpWsm/CEzvzo9JdcA==
X-Received: by 2002:a05:6512:3ef:b0:52d:582e:8093 with SMTP id 2adb3069b0e04-52d582e817dmr3573310e87.23.1719486662015;
        Thu, 27 Jun 2024 04:11:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e765d8552sm6637e87.59.2024.06.27.04.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:11:01 -0700 (PDT)
Date: Thu, 27 Jun 2024 14:11:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: sboyd@kernel.org, andersson@kernel.org, bjorn.andersson@linaro.org, 
	david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, 
	robh@kernel.org, sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: Re: [PATCH v9 3/8] remoteproc: qcom: Add support for split q6 + m3
 wlan firmware
Message-ID: <ea526b4je6jtgzo6udc6nd2vbro6apbdiloevltxiuk5vtlx63@nk3so7uiiiin>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
 <20240621114659.2958170-4-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621114659.2958170-4-quic_gokulsri@quicinc.com>

On Fri, Jun 21, 2024 at 05:16:54PM GMT, Gokul Sriram Palanisamy wrote:
> IPQ8074 supports split firmware for q6 and m3 as well.
> So add support for loading the m3 firmware before q6.
> Now the drivers works fine for both split and unified
> firmwares.

Right now linux-firmware ships both q6 and m3 firmware files. The driver
loads just the q6 firmware. Is it enough for the hardware to get working
WiFi?

> 
> Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>

Who is the original author of the patch?

> ---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 33 +++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 


-- 
With best wishes
Dmitry
