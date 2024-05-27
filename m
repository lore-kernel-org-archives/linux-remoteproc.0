Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9BB13A269
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 May 2024 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716802240; cv=none; b=Q/2BOv9YgtluVVeY6voADl2+hq0MPjtE7xcALb96RURljusRCskczEV4VcJOC4WX1vQJhWIhZFc8UlE3UFSMGSIt2KCNPHxMmmZeKQObd7qPx8i7zF89c3wDfrlMVWGA8Ebob4ZH9dB/a/ggGb+qJo9rGX4IRPF42ge3OpnFMXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716802240; c=relaxed/simple;
	bh=3ydyxz3o6EtKolYMZLw18RRj0a1JGHpEueDwR9kysUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgGPf5Sqynt1KImEDyKXXckdsT/eyyHEfpcacM3zhA7eof8oyhDeTWaomlrYi4z4N1HkP4Ko3JoGTKPCSMoThOF5ROp4M0VkuqSf8FjyyV9fq0GuecSy7joySJF473Z0rugN0ymafcD8OvAk6U269wNAX2jL0S+W92VCR+bzNZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PtGJVtd/; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PtGJVtd/"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5785e443cf4so2851156a12.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 May 2024 02:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716802237; x=1717407037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9bvVa9oWf8N5rau9sCdBq9ZmdCa+3dAviB8sfK4DVac=;
        b=PtGJVtd/Mx+BlQigN32QhR020gmZ5gALSbsyLENFQz+FUGxkhLS00V3zXb4RECdSGs
         eQbam0zFIknL9RT2FlG9SiMPCL0+TAY1FQzKMPoRjuLadBmuw6HYdl3r2ooxxEFEWpGo
         jeVjoovKmuDYuM21O/VVRpTRmDKUlbid70UKyqRyMU+iLjZAFpt3/W9sEg+MIXhNqURH
         e7Iaj+O4dt/HG3cWYiypBe0q3bz3GZT7M/eU1tKYaNkQh4cl+Fp/FR+8MTwn6fO7oN7h
         i7LMx6m8101cpPMvc0ckacHl5E8KuUXzDVY2Lj0uMKMPgWLG/GBOs1dTKPe4zujXP1xD
         kWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802237; x=1717407037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bvVa9oWf8N5rau9sCdBq9ZmdCa+3dAviB8sfK4DVac=;
        b=dZdMPaa4QQEmN20suEtwTizME0HJxFtWAGPmmg6p5V+VqwKOs9dk/M5fm/PfRwgp1w
         ptvXlaVwQtfCQKOM++srzyPDONjiA+RCUclfDNlLvBi/ayTF0qQOdjj3Q0fR+YHlhy+/
         WoKqJxMiwN4Mq1wMV7/qdOJOjWuXH8iBade7n9wcO/rLyBBi6aGLewHYVGqoZ+x6idpK
         QeU66wDrlBdJ/999a/TZcpcjtDTM3Vwh94GlbULyF/q4O32Yo/g51Ubl3TYRCbnjAAn8
         DrfyhAlC6U2032XTJIYuXtxGJUTfWrAC3Lwv9ZVl2xKuoJPqSw647O2H022o7NXnS9u7
         SBHw==
X-Forwarded-Encrypted: i=1; AJvYcCUG2/NKZT1OHMQ8Eol8hI2LySGlxk4A/w8j50QGYTDYBG4e/YF0ri752QDMF8FGW+Fg4Sru2wXe1E1WOMeybwA4TLO9u1D/URNo7GNvmlkbZg==
X-Gm-Message-State: AOJu0YwZfHd2dTQ5caTtTILVGM6kbYVTY0BeIPMIWJLb1x6GyioJxWwm
	ZsMw1vGYVkRGIbEJhjJ76Z6jMJNvzLmuEwg4/uO8KIswx1dkyV6Hsr5lCT4nRhX8ZdFOMrmdY0R
	B
X-Google-Smtp-Source: AGHT+IHjSLxc1cLMi+WN9+boVc/KXZ5NhVmN1BtPdQrhBji9yH+1iJcRPmXbeJy8ldO80V+PWWBXhg==
X-Received: by 2002:a05:6512:3b12:b0:51d:2529:7c4d with SMTP id 2adb3069b0e04-52961a82092mr8449446e87.0.1716802216342;
        Mon, 27 May 2024 02:30:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b2c9sm509911e87.143.2024.05.27.02.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:30:16 -0700 (PDT)
Date: Mon, 27 May 2024 12:30:14 +0300
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
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sa8775p: add ADSP, CDSP and
 GPDSP nodes
Message-ID: <mbi6g4l3l4hxyyge7z447azc6v2hf2whthjbj2422ehfy43aia@3ubqo45zqyrt>
References: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
 <20240527-topic-lemans-iot-remoteproc-v2-4-8d24e3409daf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-topic-lemans-iot-remoteproc-v2-4-8d24e3409daf@linaro.org>

On Mon, May 27, 2024 at 10:43:51AM +0200, Bartosz Golaszewski wrote:
> From: Tengfei Fan <quic_tengfan@quicinc.com>
> 
> Add nodes for remoteprocs: ADSP, CDSP0, CDSP1, GPDSP0 and GPDSP1 for
> SA8775p SoCs.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 332 ++++++++++++++++++++++++++++++++++
>  1 file changed, 332 insertions(+)
> 

With nsp0 vs nsp1 vs nsp sorted out:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
