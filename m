Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB111A76CE
	for <linux-remoteproc@vger.kernel.org>; Wed, 28 Aug 2024 19:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724874487; cv=none; b=uA4Ur+33wVHKCCNuvuuIT53Xq0Hnn/HQRJ6jLFmWXkSGAbSiWpYReX9N4viqfnoz51L6/375mAzGy4c7fScxzx3fyZijDBIr5NF4JTuPEc/FF1zKqziCdbNVzgNh9B7OflOeeCuws2y8CyYsmemHxH1MBuTPvaroVGKWBzRys+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724874487; c=relaxed/simple;
	bh=eEGI3hdxZ8+12KRUhT1B6CqzyWkP7zuPPsBP1keE5sE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJ0J8hoHpTAm6+6PFOnqG+CR9o2Io8Qjjpomqumv8AGJkNtnCNJmDeAzH1vu8GSVp2K4W8xybRJ3tHwzSomjrqQ+MnEUAqRsmB7LbpLJyyMGWksUDoJkm6WpI9U2x3iqDx2GHKFUKvVJT009dX0gBBBqfAOxDCwRbSr/7sBub4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J2WDVWVx; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J2WDVWVx"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f3eabcd293so79867951fa.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Aug 2024 12:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724874484; x=1725479284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OBzjJnYvoExoTdxa+EXBkaygJuIm6Aj3yINJ1UWhUis=;
        b=J2WDVWVxuWcQzaMMsz3k8QxIiU2Hte6ndGJBvq2RbO8CKb8M9I1xrL2F+TkBpVTCnq
         ayOayHMPOtiG9Yq3g09yYg2zLmXpVsc3tu9UjxHvGbja1sVE9G1dwRCd3Lbk9oTNwVZJ
         Lii37sJtzc98di1l01a/aIMEEzT4d0MitEWoI7jEYox3Vau9bb7Qcu+AxSuwDnrj/siY
         4fHIRUBrGvsE0GrDBhZ99u1Gmc10i1fifrFsPXpt2o0OjPQ4loMi0wUdKmYkH79q8ekE
         uPzVXTeVntzw9pOkJaW443+3fYiQhpKQ99f+pGcltlg8+psAQM52XDdTb87ZzyqjqdrN
         8e3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724874484; x=1725479284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBzjJnYvoExoTdxa+EXBkaygJuIm6Aj3yINJ1UWhUis=;
        b=GDP4LEjn1zk2mWlV/45h3S67sz+1SmHXYAAtsHI2ibF7KcG+HBdvSq883yzTEPJdLC
         YGErzvFg46mvFRKE7PtxZPsln0lZwPUE4hoEcxz0NfwFUiN2HylvUy2QgTeQt7LxWV6v
         kradTPLXIDHCZKub4zBRg9LsV2BimFcj1q3kOMcQvLbA/J3bMYvyXNRQFRWAoexlo1Ul
         id7X6OI5WFG7WysNUo7VJIqo9jvfQLCTOc84uGnmE6k0+c01wGA7v7xQ/LLo7tnJzJG0
         1al4YooQZ2qRopB0jccq+rcWjpEezWC9bnXwSVo2tAx+Tes0uKAgLTJmXyPVCo3DVtnV
         o7yw==
X-Forwarded-Encrypted: i=1; AJvYcCXD1b0mFx0b/fL2Ewty/FMfFMXEvVgWHKDPfvEc6UfK46ZLbeojIB4uEInUVbokWTO1AXHZ80boN9+8oPg0JnTQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy55SSrK8D/DoehMmLZentfH8wrDQwETSSkZvW0fOyr4msM7gMm
	64tqbJAGaRNiSnouupfrO22ysA5vg4EowTYL/7LaW8DjixtQef0KefD37ydj2zk=
X-Google-Smtp-Source: AGHT+IGtsciDwfFdHJJ8eiekoA8VHrlLbxk8Ypd5NxkIvHj/hMIKGkalEGw+8iFeInHnJaOtTCCSOw==
X-Received: by 2002:a05:6512:ba1:b0:533:4722:ebbe with SMTP id 2adb3069b0e04-5353e579649mr216247e87.26.1724874483178;
        Wed, 28 Aug 2024 12:48:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea89134sm2260469e87.270.2024.08.28.12.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 12:48:02 -0700 (PDT)
Date: Wed, 28 Aug 2024 22:48:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Ling Xu <quic_lxu5@quicinc.com>
Subject: Re: [PATCH v4 3/6] remoteproc: qcom_q6v5_pas: Add support for
 SA8775p ADSP, CDSP and GPDSP
Message-ID: <m732ashkt5rkadh3mlm44t6coomsvbz2f53br4twt35rzlafcy@sbc7ztnsojig>
References: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
 <20240805-topic-sa8775p-iot-remoteproc-v4-3-86affdc72c04@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805-topic-sa8775p-iot-remoteproc-v4-3-86affdc72c04@linaro.org>

On Mon, Aug 05, 2024 at 07:08:04PM GMT, Bartosz Golaszewski wrote:
> From: Tengfei Fan <quic_tengfan@quicinc.com>
> 
> Add support for PIL loading on ADSP, CDSP0, CDSP1, GPDSP0 and GPDSP1 on
> SA8775p SoCs.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 92 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
