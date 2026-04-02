Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2143164AA
	for <linux-remoteproc@vger.kernel.org>; Thu,  2 Apr 2026 19:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775157600; cv=none; b=PYUiVXDtW5JMxOOzu9HeZSZOeFfye7RN7g8Q0sx3mf8N6fJIQUMErDkhbeMc8DtTIpP8c/ogEpqXwLQm+48MyHp9I/Ayok0q/7K9/h6Yye08rQBBRy9x6Hu6d8lTZRLO35mj2qwC+ZDPwXXtsTM99WEWK3IGAgodlMe7e7C/Idk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775157600; c=relaxed/simple;
	bh=YyI8jqYYhdko66cyM4N7pIbtGvQSQvESyQFAl7WZidE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3N0uO7Da2bYfHU8eTENr9uBg1pQbVjKp3RlGMSAAy05OZ2Lb/65+vhDJA2bBtgMqZLFFja0BSLzzvlKyv2hkUJrWT3YrKjqBpouWrslPDuqg7VcuJKMS5hoP6xmndewNpqZO98LAm8cfiUmsncxZMEYMmOLcZT/5wU5tKxxQ64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vLjJdat+; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vLjJdat+"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82cd6614a90so567242b3a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Apr 2026 12:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775157599; x=1775762399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3jSt7uwE7EC589yxv0VmtI2sQo0+2W9n1Ml7lFclpo=;
        b=vLjJdat+nTes6KzoUzRzUrAqvQYzV+TfH83iZ3JzefZNM6q2L34V6RooXq/e17I+uI
         7/VwVx/FaGOQXe4si0mUTKNqRTvTMCbVWrX4rUmBCL0uwIl1eu0UZttmkg421TARFk7c
         XDHbRsm7g73KiTZW9OHGfzMq/9mE3BQJptd2+9gyGqJV7NhzcQllfgXjmSOz9IRbybHt
         XJUnz3bhgqmi/itjHk7hRMq/WGWw3g5sD131HHJFU6MOnjHULWQ1I9ZNGKAU9EmKDGy/
         Ib8O5HmSSzX70yfAtopw8rVy9f0kIFvoI2GVRLy4YKBiqKmmp40qmWjyHcvqDiQEl+YT
         M0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775157599; x=1775762399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3jSt7uwE7EC589yxv0VmtI2sQo0+2W9n1Ml7lFclpo=;
        b=LpCY/gw2huqS9noBryjpKgRY/tTDgrI/2+GB4JFd+yCaCwsu7hy7Gch1luo84mqJ+y
         PWdB+73U0Lt85pBNLGFZ5yDCNPuyFqyoxRMxkJeAx/J8j09q96EAW572ia7ZUpBceCY2
         buD2Yk/hvpjTIlUr+501Dc3oVk8tERtcl7cDe5TcPWRwfGS89+x7Gs42I4g8nl1lEplA
         R/7+5bYqJOcY/sxM9GXwSzekf0/a48lTdVmoPZd+tF59mS7ZUtIVwT4DjEvEYNhEmOV7
         puEv0JCNiKj+Y24DldkTe7H8/YXAd083kfi4Sro8HPRUa2rcA9mXXS86t+tGTQx8ln4W
         TIBg==
X-Forwarded-Encrypted: i=1; AJvYcCW2ZqiXCw67iXK3iLL+rpDEpEE71ejawXF0kuNCF45tMAVXyLa0y6TOnHI+lcd8gmLmkgx0j1ibpkYtfVEAZJmO@vger.kernel.org
X-Gm-Message-State: AOJu0YyR7X5reROatMow3L9vs8mXaTabq0QuItplSG28y7iXY+YPyC3F
	B4GqYJy21e/HQtcIgb6nTEL24K5/sISgd9YoNOF4Lg3w8Q78zVP0svShK3C2EBMsBYM=
X-Gm-Gg: ATEYQzyiHfxxch44A6E6lW0XcRjJCdqDPKuTC1A4iN7RXxvZ9OHQ5GpWSRlGvDABrQr
	vVu+DjgvFa67QOMpnhqkqyNCyAHNkp6BSSK8F2Dkp22oHZuX9PQfiVj/bWO4ZIn0E59p86CjKS1
	h48Pg5V3vRKuCVgUzCxQzATBEA2S3KzRrc8otrTN6LQVoetKrDkW97jB0iwZAh+XNccVJmx23HI
	7D/1/4hVJx1EgKczsKtTghHKTaH1Dm5NR3Gb/zB5Zxg6tUDpFTkRrI7cIimBLipXbY0MvSIuvff
	oR3p16OTenmArTOlIdKtlrAx1HWQGcy/9s+On8OBYg/iSP1Qia3vQw6XMy1TEvg5VA71A20PwHa
	AA7OWbuhyw/D7F6e4s82GSXQtK+Lkhrcy4FZcm6LXWEZ9fU6P1f2HgVjO/vh1d0dHO+pkMkLyN2
	u3wuwkIsht9XdbykSF4ZtejYTFfpeaCFlFroQ=
X-Received: by 2002:a05:6a00:178e:b0:827:455b:86b1 with SMTP id d2e1a72fcca58-82d0db693cemr329162b3a.28.1775157598929;
        Thu, 02 Apr 2026 12:19:58 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:845:1274:f83b:b11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca79basm4904770b3a.58.2026.04.02.12.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 12:19:58 -0700 (PDT)
Date: Thu, 2 Apr 2026 13:19:55 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: andersson@kernel.org, fabien.dessenne@st.com, ludovic.barre@st.com,
	loic.pallardy@st.com, arnaud.pouliquen@st.com,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: dead code cleanup in Kconfig for STM32_RPROC
Message-ID: <ac7BW9WLn7V9rDEY@p14s>
References: <20260330224545.29769-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330224545.29769-1-julianbraha@gmail.com>

On Mon, Mar 30, 2026 at 11:45:45PM +0100, Julian Braha wrote:
> There is already an 'if REMOTEPROC' condition wrapping this config option,
> making the 'depends on PCI' statement a duplicate dependency (dead code).

You likely meant "REMOTEPROC".

> 
> I propose leaving the outer 'if REMOTEPROC...endif' and removing the
> individual 'depends on REMOTEPROC' statement.
> 
> This dead code was found by kconfirm, a static analysis tool for Kconfig.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  drivers/remoteproc/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index ee54436fea5a..c78e431b7b2d 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -316,7 +316,6 @@ config ST_SLIM_REMOTEPROC
>  config STM32_RPROC
>  	tristate "STM32 remoteproc support"
>  	depends on ARCH_STM32 || COMPILE_TEST
> -	depends on REMOTEPROC
>  	select MAILBOX
>  	help
>  	  Say y here to support STM32 MCU processors via the
> -- 
> 2.51.2
> 
