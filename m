Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92321552FC
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Jul 2024 09:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720518385; cv=none; b=I9jNYkQdyKpgcDYBAUXx/lWv4YosLcUY2AchPnn3W+NRdNQoc7673dicwQjnSJ8KbG6CPN3Igi9lLynmOVGcUlKxrWIYvrDUoyJ4g6UGq7U51zUa/U4yTDi7J6IO4r5tpFe/AMkmScoLjMGK/jHru+qJqR/TaX+rgzUv+TVb/Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720518385; c=relaxed/simple;
	bh=xrX9189y3J6RTL9wsavIida+ycAnE1HLJ4O+uVBj2NA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a76uIgNIu8Z18NcSQ9Ovs7toXOqOZmvm/nFRzLfPCjZEYc7PomD9byn21k+ii+j1jljDXpqHHrHqYruUgFGIJSdSqcnOAhG+xDEpf98nsoJ8Zy64RuYeD0DZqBQYfkBYk9EdF0cdBkU41B9rzstVj55UMHcuPqFDo1RovgNcBJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mH9RaYcf; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mH9RaYcf"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-58bac81f3f9so6324078a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jul 2024 02:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720518382; x=1721123182; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xndzXPaOahAfjvRuCniO4KjfCO34NFKI528Yw+eLHAU=;
        b=mH9RaYcfzGjv+AkSavGyyq2EBkJym+eyoFHZU8iXnMSi5qK+s4WHqYpPd9PuB94P4E
         N1QfB/wRRNzec3h79GLkJth3H7h6g4uUKe/Y+TASj/BgcOQkrMOGSgk7Bz+AHnHm2L/k
         N6r7kzElcbkazufjqCsP+m05qAWkAWuAa8sWmwTamW+gY45F1r6GmktW+UUopq/tF67x
         mBH8s780ufKTN0JNL9DdttIqGYuZ6Gea10rrFGELAn3GcnXx/P15pJP6gZEUBNR5qAMV
         H6klOF/3kmX6o+DiLR1EqM7oPpJlk2hYfOsd2Fj/iiGYGo+yNn7w8+MubK5LTUJjYt7S
         dgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720518382; x=1721123182;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xndzXPaOahAfjvRuCniO4KjfCO34NFKI528Yw+eLHAU=;
        b=vmeJWMMgc2x6FjzMXpv9NCZ8L0Lup2Y9mOFx/SPO0pbJVM15p9Gart9ZAK/2Diq36M
         yCChc6ianVgDMMkXTS0IQdnshQYo/u66i8Y/YJ2E9ggPX2Fd/t0bzFBc/zSs3GBCuA0u
         I/Hqo32iv/CMpmZ5I7ynNP0IB7vCRYQhH1Vya7C2UIvj5AmTEiXN5NAQEm7p690qp9ZH
         U7sAPbfmd4qDft6zVNCy3tY0avlgtMXHr964R3fAFA0kHIwidw+2caa6PV885Df3w/jZ
         x1h/gTnrzbojTIUt96qt7JO2NyajtC9NfHxWiRzIOo0eql1A1sxrkviql5WN0VdRgnMP
         xNHA==
X-Forwarded-Encrypted: i=1; AJvYcCXi/SZkERwfrdDmfzwfOH54ExxUxeOrQEPrOYHa7I7Zt4DDLt3tSH5/PC8UaN2dMAAy1ONNuPUJ1NYrjR+vZvDKe4HuFRG909VIl1/p661rmw==
X-Gm-Message-State: AOJu0YwsBhjEirq9fIu6WdSiEUdesDSIsxZYmbVWN1JMfrJ10Rl2haPB
	ukw6NPG4I0hStaMNZ9B421Fi5zAIu/j4mq+Gibzt4iaVaBULSKgyk195hkCVhac=
X-Google-Smtp-Source: AGHT+IHjPy7oHxBkWuRW/Jl+7QaB0fxfudKtoUsrHhltTvPwL7lfVnDuCLwUMhpeiB4EqK+93Z30TQ==
X-Received: by 2002:a05:6402:517a:b0:58a:e810:227d with SMTP id 4fb4d7f45d1cf-594ba59f8d6mr1113424a12.21.1720518382094;
        Tue, 09 Jul 2024 02:46:22 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bd45a162sm849610a12.68.2024.07.09.02.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 02:46:21 -0700 (PDT)
Message-ID: <ac53d26a-b2f8-4172-987d-b4fcbb7f6e51@linaro.org>
Date: Tue, 9 Jul 2024 11:46:19 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: sdx75: update reserved memory
 regions for mpss
To: Naina Mehta <quic_nainmeht@quicinc.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240709064924.325478-1-quic_nainmeht@quicinc.com>
 <20240709064924.325478-4-quic_nainmeht@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240709064924.325478-4-quic_nainmeht@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9.07.2024 8:49 AM, Naina Mehta wrote:
> Rename qdss@88800000 memory region as qlink_logging memory region
> and add qdss_mem memory region at address of 0x88500000,
> qlink_logging is being added at the memory region at the address
> of 0x88800000 as the region is being used by modem firmware.
> Since different DSM region size is required for different modem
> firmware, split mpss_dsmharq_mem region into 2 separate regions.
> This would provide the flexibility to remove the region which is
> not required for a particular platform. Based on the modem firmware
> either both the regions have to be used or only mpss_dsm_mem has
> to be used. Also, reduce the size of mpssadsp_mem region.
> 
> Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
> ---

Thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
