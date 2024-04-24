Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7FC13C9C6
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Apr 2024 20:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713989658; cv=none; b=Ws3n/EQfvhwEsKOrAiDK0s1BJt3UaeBPg7mz5XYw3fw3oudQ5Sd3rlcWsw0GDPz1LVhw05Z4VzNEdu82FysSXZVESkR/+0Nz3PfKL89vk0fx9NaxM6veKbklsRZmirt5Nl9wNBjd2gCKVMhcSjDjGhUJLxhglo5lOsnqU5QcSbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713989658; c=relaxed/simple;
	bh=5juKDdGEYxNl2ENPjsF/4a/Y2iZb9ON1oaGj0sw8O/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNctJ3iZZqVanhyMy9j1q8fP0ko/S/N7hTys3QT1NzUPMVi0R/A/q9LEG2yEuNimRMP2Kd9x8Yo4XwFh6eFAkNsPSKgLvRdF47Kyv7Tq6Gog37fGExlh90UBvP/+IGnUcOzkNau+v1Qa8wDQbJuWCgZck67cX7weALUVnSldZbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b3OhA8z5; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3OhA8z5"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51abf1a9332so261293e87.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Apr 2024 13:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713989655; x=1714594455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rcWOpWv1JwDPxWKBqvGmsKPJY5XCaFq86YjpwkCYxAM=;
        b=b3OhA8z5o9t6l/iMUxzeCyqwRqemHy07E4e011rU7DnEm5rKwB9+o6rHl8RRvhGeFg
         jH7DPkXESS0e2OiVgQ60TiafxmSCGqDHLQdfVHu9xpmOGBbSlhwKabDDJE04JbEaI5wl
         rUAg2eV8pJH20dV2PYeSkPfwTMGeH9s2aeXEFGlKAMFUbgkGw4UoFfXyzqdnuWYNg1p9
         qNY3mOLZxDD/4ERo0M4IH1g6k7gHdTpbJkYxhW1QCtV7Ds1kuRwSFtk5ZDmTBO1rbNgG
         MUteWEH83DJguTX6h9XzCSwB88l06OfYN+X/o0F/iGzkr6xwCDH5dFd535tJrH6W/dgS
         EW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713989655; x=1714594455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcWOpWv1JwDPxWKBqvGmsKPJY5XCaFq86YjpwkCYxAM=;
        b=PpeXd3nBMYeWsKqw2L8t0EABD8nryhK7B2KUujLQqAr2ZoyAZo5ergShEmzEQL5tXA
         xkE0EncnUlvXCIlD9pgSQ5CJDOZud+6Ej9qbmblolusimP/3XuJhPnHoijefFcgrfDLq
         /Jq53fyZeLMO8kd9rGyfz+r+lnc1CoD1tYefvLC8WhfVO01nqqieY1lcsmcauEbXXkni
         bYd/0Z4Q8r5l2algXoGrhRCMe4BZ9kHaCjeb0v7V7D2oMWirWqeiDtU5ajPDi0abyifY
         xGXhH0gQEMn9G6UU2gfum95nx4MMbUDISz79T9Lb8/jte/MS0ohunrvoMO5ImHqHN/DC
         RPRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQkp6PX3j8AARtdW0oeylfYbEDFcsQBUPV2BnYxyTfu5qAoCtv8F3O1zal8h5dYWhxF9OmtjzY23xELk5btn4Nzh8QV/AapykFSFFvc6o3NA==
X-Gm-Message-State: AOJu0YxIt40ONEscJlVmG0tGUXedjWDuLNuZd3UtBjKbA1QeonnpCDdb
	SA5z++Isfj4nJt6wSkWxXNQkE0O4Mc4uogvofE/sh6VmZqpxIzVpE79z7M6nTFg=
X-Google-Smtp-Source: AGHT+IGKFpuv53xz6smLPRnAcOKCBqQKU3AL5w75zZ1Vfp+dTl2SO2Y83PaVVYHYOotaaRh+b6uWJg==
X-Received: by 2002:a19:ae0c:0:b0:518:f697:fac with SMTP id f12-20020a19ae0c000000b00518f6970facmr2576684lfc.18.1713989654992;
        Wed, 24 Apr 2024 13:14:14 -0700 (PDT)
Received: from [172.30.204.223] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id v19-20020a05651203b300b005159412ab81sm2517926lfp.216.2024.04.24.13.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 13:14:14 -0700 (PDT)
Message-ID: <c4a1eb9c-5d20-423f-866d-883917c54a6f@linaro.org>
Date: Wed, 24 Apr 2024 22:14:12 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: msm8916: Use mboxes properties for
 APCS
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240424-apcs-mboxes-v1-0-6556c47cb501@z3ntu.xyz>
 <20240424-apcs-mboxes-v1-3-6556c47cb501@z3ntu.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240424-apcs-mboxes-v1-3-6556c47cb501@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/24/24 18:23, Luca Weiss wrote:
> Instead of passing the syscon to the various nodes, use the mbox
> interface using the mboxes property.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
