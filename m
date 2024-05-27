Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE90D13A26E
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 May 2024 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716802314; cv=none; b=oXEdB75EhIm0+HX+rNRxrp6oQ917vw+2R3FK+5/42QnTUstewEhAq3jpXupkKj6D5fk7tz3IJg29QKVckFp4I7mPF3/NesBOXowFtbHniglLRQRvQdvgkip5VBshjTjILIzzXTHy5dktBIXuuDWtNmlsz0P0MgE61dl7TSvEOpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716802314; c=relaxed/simple;
	bh=yQdJN/Dk3owFDIxvxJx2sG5wCVgCZ5ezvplI+HnF96Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/mu+8NYCiVexMEevUdjNkrlMVUHG9/TnpeB+PysemztOodiTx2S6kvQ33R52zksmPeVGctGe1LoaWl2wGHerz2HcQ6/1KZ7hJps569TcsQcpAUw+5PpIwWCK4waZF8CR/C+NB4N9vpmdCJ08qQgvtPIXQ28Km6nF9SncjlfnwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P4shJbXl; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P4shJbXl"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e95a1f9c53so37345641fa.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 May 2024 02:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716802310; x=1717407110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9lOIEDapMQMFTempzCjLBBiczi+5oN0ctNRlc+fPjUE=;
        b=P4shJbXlTtVD0XhrOvdcbHq8YBMoQGynttpg+41T55COJNyPdNKbnB7/JGhL3gwRlx
         NASHH9tV3Ky4LQR4q//o9nnTZzrZJSkEOvMk4zKXZ/exqa+KfZmRZHdXdrYZM0K4Rtva
         I+H3NCs+ZeMVVDbfczg66EBpMN6aI/Kcfrser5bQHU4Kzgobi8Zt0/XmSGDZN52q8cI3
         FnpHTKfNzLG4Y0v6UZpOnUuSBiUwF1edsj7Nkax/t3DmR+GLDUbQbE6GK93IZe6PfPEn
         Khyop9llaPkuxm//l7gJmgDLdYJPFteUGZ3U9v6AKcRn4NZfgLNeBhaM/P5LVgjoPRkM
         0lHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802310; x=1717407110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lOIEDapMQMFTempzCjLBBiczi+5oN0ctNRlc+fPjUE=;
        b=LXNkr+0mHxmPjx3si0vTIQ+LgWAuXOKI7GhCE7nYc7lUuUu3GKxio4QE66um83qC7i
         BbvoxLIngJAR8+f1mCLups+YwBP3JhKPvjDTp2rm4nEssV3siQGdUxQAHHcW/OLL8p1y
         UdMt61SuHsLYazvtR83EdxoqCFDV5oEK9C11JYUS+bF/ILMtygm2JPmrER0OreZpIhmi
         8FriBW1cDBnxaWQtK7ThXNYvZVyBDD/4NUkzGKz7nLytuM7V3/IUpjLvQsS1YgYTHccL
         jqrbBGiWL47Y6qN0Yqk8pT0V1+nCqqUCKHcPMqFB7ZdXz6vsrg4dtc35m9J9UEtFcbNC
         RzaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhSdNcQsE9X7BJ0xSTcjzZiLn+9VViVFe3Wn1A3S4Pw5fQ9zcc+efuJHpCIs4uxRvBrCgf+MXZD/1oe1RV4HB6hWEJ/x5tQ9oxu3+yTPXvcg==
X-Gm-Message-State: AOJu0YxpFJJeNXwuRCwjPn5ZeNx240q13p6rChp/aWURh2n4bOXGiaIL
	aA484CSLFj2NbB1cGkY4J67/hvh9YvuYY5b8gf40mJYGh+71NiZRTlJvdVTFaCY=
X-Google-Smtp-Source: AGHT+IEPv7EDp4kePquA7op/6dhZT+drl8Ylsz2niLA2tU/NQtJi/aGWxOm0a7bFtOI7nvkBSVJRJA==
X-Received: by 2002:a2e:3a05:0:b0:2d8:da4c:5909 with SMTP id 38308e7fff4ca-2e95b2cb370mr46039831fa.51.1716802310053;
        Mon, 27 May 2024 02:31:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdd14c7sm18590791fa.97.2024.05.27.02.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:31:49 -0700 (PDT)
Date: Mon, 27 May 2024 12:31:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Alex Elder <elder@kernel.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sa8775p-ride: enable remoteprocs
Message-ID: <sgrflejmt5btqgruqot3epcs6zdl7wozru66ddqcqgm73gspqy@hjqoo4yqmrdd>
References: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
 <20240527-topic-lemans-iot-remoteproc-v2-5-8d24e3409daf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-topic-lemans-iot-remoteproc-v2-5-8d24e3409daf@linaro.org>

On Mon, May 27, 2024 at 10:43:52AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Enable all remoteproc nodes on the sa8775p-ride board and point to the
> appropriate firmware files.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
