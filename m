Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BF3142902
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Apr 2024 20:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713989712; cv=none; b=hms52VomHDJA8HdEnWEFepG0shH+GvUGHFD4uBC5LCksnH2olWjf7k0gIIW9ZTXOe0swtwXk2sB+3BebCUhttvARG2RxMAuEf3Qv7FpmD9DG8GBkTCDhThsrW2P2CQrXrj+gA3eQ16USESGUhRdMBTdAaqVXEu4eaBN6U8sJr68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713989712; c=relaxed/simple;
	bh=zEHff0kOsNqcnD34AolsEJqJZojJu0lF4ekytQFs+Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L38eQ9rbQwbAnsiqqJjgXktaXLE+2KtA3tiQqxq0TeuXk2PnbaB5I8ErSt7OfFrEH9hl1Ttu5y1vL07EpFBgcOHipcJrSvvuFc8VVgcbJBamfoa7CdKr/JmK2itd58LfMAQky+PO2B51NgByfCmQGxXyJFSjbNIuGm7zISVxfqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lxbN6s5l; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lxbN6s5l"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51abd9fcbf6so357120e87.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Apr 2024 13:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713989707; x=1714594507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QOIJtx4Ury2crgPtbLFjxKxDWX++kac+S04qd7LgELM=;
        b=lxbN6s5ljSve1Ichjgoqi2LaG+dorhRe4KiloLTj7LVTOuPuQ3ZOAW3BniFTb0mLXw
         0adCocSFLZZiBiWPQk8dfH1hQGIMPM4/pKBRgAt74422lWdpDXHkEn2rJmTXameaIyXI
         qAi1v1eGGbsiVgJCL//wMbMrU189GbGEzFQ0lWhwmXMiayTtFpWHev79N8xvg4MMSZkE
         yztxffG3PpQ+Yxel5wB/Ceh+899uRZ7+9gedzgXnUnG8zrmxI+4bEYwrPzoN44gsGUvL
         fY4DzTNApuZHAX+CTv6FGVr/SRFjrg1Z5cOE5ZjoVfPA6ONRIr+DxWhGRSUNd3OWgNkk
         HU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713989707; x=1714594507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOIJtx4Ury2crgPtbLFjxKxDWX++kac+S04qd7LgELM=;
        b=eMN6oOmfYEjZQEyJFL36HcEXSIj4AmbP2QW6y/6am+1iXbxtkdC06iUxdHhoTciefO
         ibfX8aqkakO8RqnHA0h9K6+HffTHSgcKvTQVEG4O6TkdR8yubaMeDdOTJeqakwZKHjvt
         qm468s6Pcewb9kImuVlMEm+rwlLQL35SFCNqlBv9sSH4WHqY8Auxf3wRk+NaVkQttSDC
         6lX1H2DstKB9GsOTWV20suks7cw1y5L9j5obbvulWGX8aQvdZ0Li3J15WY4LeLRTsBKR
         7LpACzmmPtevg0MWrOAeqC5zGQhdh9j9u77IUgy9dCC7NRXFCPWGSar+ffXU/bbi4XF+
         mQXg==
X-Forwarded-Encrypted: i=1; AJvYcCVnNh07z0ouaMgnD9jCORTW0azCImP8kZbDfykGR/hCXm4huRB4S6iRMLA7WGJNdFFwRRJrdgnAcxMr2cM5pr/Q1iT09NlLbRCTI8d56/g/Dg==
X-Gm-Message-State: AOJu0YwjQ+YFyeyucB2CGcKDPJ6zkqs6kv4s8hpIyShlULcgGkY5PXEi
	h+R1XvF9l5lHBBE7/EmYTQSKhjN1xSekil6TEkGaJI1UczQr3NaF04WJO8ZJxEo=
X-Google-Smtp-Source: AGHT+IE4P39FwK1gddpY+oonY04hW8avKhbcxviyDOHns1JCsuXVHceDCisUKHEX6UzfzyJbNMg7vA==
X-Received: by 2002:ac2:4e66:0:b0:519:3cbf:f734 with SMTP id y6-20020ac24e66000000b005193cbff734mr2943564lfs.49.1713989707645;
        Wed, 24 Apr 2024 13:15:07 -0700 (PDT)
Received: from [172.30.204.223] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id h24-20020a0565123c9800b0051b5efe5985sm155830lfv.255.2024.04.24.13.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 13:15:07 -0700 (PDT)
Message-ID: <9e3eb1b4-fe3d-422e-9076-eaea6c78cb32@linaro.org>
Date: Wed, 24 Apr 2024 22:15:05 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: msm8994: Use mboxes properties for
 APCS
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240424-apcs-mboxes-v1-0-6556c47cb501@z3ntu.xyz>
 <20240424-apcs-mboxes-v1-7-6556c47cb501@z3ntu.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240424-apcs-mboxes-v1-7-6556c47cb501@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/24/24 18:24, Luca Weiss wrote:
> Instead of passing the syscon to the various nodes, use the mbox
> interface using the mboxes property.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
