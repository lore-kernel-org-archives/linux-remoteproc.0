Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8191AD3FE
	for <linux-remoteproc@vger.kernel.org>; Wed, 28 Aug 2024 21:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724879123; cv=none; b=PEcHH11ycgSMJN6m+GDEpYH0steroZDl49VEZgJPeK7koVK9h0ATtBLsvZ7OyOn7+BgNUExXB52KPXBZg0mV2GVJUvRE2cUaVTOB1BGTWHWEzXi6G/wbNh3r5UXz8Z3sRmnB7d63dbDQdftYA/bhb0ukL7O1HarP1XGMGTRHd60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724879123; c=relaxed/simple;
	bh=xw/CcMz6j7BEBe/0r7XKlnCuk0/U9f4ac4w2v40x8e4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPSyLwWz/mFwj6HXK2M+MQCfq0kEOQztZxgNWaaJr5CT4DzAqbDDSY/BBiPayMitzf3PTKWUN/AkeHvT/qVC8P5y1jOPU09Z5eyqGzmLw2XzNwMJ7UoKuK5jVFXLWOOQ9Y+RkLUoUo0hIIxLcAbOBWxt9MqogBBafdqZaX/hcBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wuf1HVnb; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wuf1HVnb"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5334a8a1af7so7068711e87.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Aug 2024 14:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724879119; x=1725483919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J8P1AfMskY/XNd3kwlMg/4oyb4V66AijIk4o7h53BOc=;
        b=wuf1HVnb5IqraD2dhlHqzVZuOO84yxt6DMQy3p5itgXbYqzhSeo7Alkv3pabW+kfSI
         F3H79OxO/NkRb6Lm1cYGbsnNO2y7MX9HD9XcOadCyyU/ZTZCRiaiL6KRbNqjxw66x7Yj
         VSk51mr2jgduB1vHjCYo8o/v/Av2LfuWnC6UrtDyFdmy5OCyVHe76P2Xz5M+zKwx5D+e
         orCoD9wuTCBub94nY22fGCDScVSFFCI7un/Fixr8eb9dCwKPFfHvCKDEj0unletXFXt+
         +vQ5M/2gJ9STIws4VGnHvPmvzsxglB8b8vAbqHYV6Xxddln989t50zb7y7k+X1nkRmVK
         KQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724879119; x=1725483919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8P1AfMskY/XNd3kwlMg/4oyb4V66AijIk4o7h53BOc=;
        b=fiPNhjrm9zFTbuLOo1CpjKIBDvxV/Trnp/tYFkhc63bVxiMZqYrTyEHjVBA0OrlRUX
         x8oMGIJpk6UoOgWuw7eBD+s1CEwL9bfi3W1uReYMoq/Oexbq0gfK+SiIENbopeJc6XcU
         fybEUlmm4bvcj4qv96CCebzUHrkOmzQyOWhxMdgAgwOTqIfysg2IWsag+eYir8sPvY95
         AOO3J91yYQ/ApbnLMnM8shqHfS8cYqZqTXcb5H1kBnURM/NQJrDILMCE+nyCBaLRXggS
         mgRXM9vpP+ngeJz853stEx/MtyBdgsmcBI0yclylQC9NvoygKMQHaCmpx+9GRzWVPWdj
         ywvw==
X-Forwarded-Encrypted: i=1; AJvYcCU834Ar7Ar38BsnYa+n319I1SGhGb7Tpc9UfGHQ2eA0mvWYg60oCOnAIXYHPUvEm/uqwclpy8NOIM85VG8pKpd1@vger.kernel.org
X-Gm-Message-State: AOJu0YwFJLWPgpSKjekeT9a8VbsvB5JulPWz3zwvrlooZu1tFJieKEla
	RiZ3Tzz3ZikPyskUYjPxmwRiulRKIpLzFWGPjcBkQqu2sNASWCQYyQHDYRdWNWg=
X-Google-Smtp-Source: AGHT+IGwy00ojcB+2DLJtwYPQ2cEU/bfftwOA25DuW2BUnyVrQjczSw876qvUyAwWFtEYqRAhYN0BA==
X-Received: by 2002:a05:6512:acc:b0:52c:e3bd:c708 with SMTP id 2adb3069b0e04-5353e548762mr303636e87.10.1724879118526;
        Wed, 28 Aug 2024 14:05:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea29321sm2292090e87.25.2024.08.28.14.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 14:05:17 -0700 (PDT)
Date: Thu, 29 Aug 2024 00:05:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, quic_varada@quicinc.com, 
	quic_srichara@quicinc.com, quic_viswanat@quicinc.com, quic_mojha@quicinc.com
Subject: Re: [PATCH V2 1/1] remoteproc: qcom: Add NOTIFY_FATAL event type to
 SSR subdevice
Message-ID: <o2auzct6aoda4hifggxjtsyzskx2edbut2lmpdf33fzvkczpmd@ngen35gjnoh2>
References: <20240820060943.277260-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820060943.277260-1-quic_gokulsri@quicinc.com>

On Tue, Aug 20, 2024 at 11:39:43AM GMT, Gokul Sriram Palanisamy wrote:
> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> 
> Currently the SSR subdevice notifies the client driver on crash of the
> rproc from the recovery workqueue using the BEFORE_SHUTDOWN event.
> However, the client driver might be interested to know that the device
> has crashed immediately to pause any further transactions with the
> rproc. This calls for an event to be sent to the driver in the IRQ
> context as soon as the rproc crashes.
> 
> Add NOTIFY_FATAL event to SSR subdevice to atomically notify rproc has
> crashed to the client driver. The client driver in this scenario is a
> ath Wi-Fi driver which is continuously queuing data to the remoteproc and
> needs to know if remoteproc crashes as soon as possible to stop queuing
> further data and also dump some debug statistics on the driver side that
> could potentially help in debug of why the remoteproc crashed.
> 
> Validated the event in IPQ9574 and IPQ5332 by forcing the rproc to crash
> and ensuring the registered notifier function receives the notification
> in IRQ context.
> 
> The client driver in this scenario is a Wi-Fi driver which is continuously
> queuing data to the remoteproc and needs to know if remoteproc crashes
> as soon as possible to stop queuing further data and also dump some 
> debug statistics on the driver side that could potentially help in
> debug of why the remoteproc crashed.

Please post the patch together with the user of the API. Right now the
series has just a single patch in it, so it's impossible to judge
whether it makes sense or not.

> 
> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> Acked-by: Mukesh Ojha <quic_mojha@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
> changes since v1:
> 	- No changes. Rebased on top of linux-next.
> 	- We will now have a user for this notifier, ath12k.
> 
>  drivers/remoteproc/qcom_common.c      | 60 +++++++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_core.c  | 12 ++++++
>  include/linux/remoteproc.h            |  3 ++
>  include/linux/remoteproc/qcom_rproc.h | 17 ++++++++
>  4 files changed, 92 insertions(+)

-- 
With best wishes
Dmitry
