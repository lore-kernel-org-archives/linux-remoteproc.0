Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F5C185E45
	for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jun 2024 17:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718645609; cv=none; b=UvtIIxsX+kqh1q1mTee5ejjFlNC+PrWJyEzIoqo/fv0bf1ohNamOz1vtNCCqKZu9N38d8iN0BjH+gY5gignWHpXp5dUlkaYzaspLI55mKWGsrQIMR0wTOMJ2hvPnC0GH4yEs+nMiaY9bgOjoSR5LT9H5GZYrEGvFWXOsIjdYE0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718645609; c=relaxed/simple;
	bh=PG3BCj9R30OdLhZZyfrDaoTTRFm41wylvyZJx2O0h7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nskl5Z4TGgFyhQzinEAYiMgBfC7yH1GpodTYuSitcpZ90V5lnCY5obU+MPQA9YkPx7QFZzLhaf4ZFxcIhUjJ8GbppVJdgVU8kx/ZFEDtrSulDeIxz3eCAh/yXZQC9dQj5OlT/bxaAEiVE9yCGhU86KEoIoe0PzhCltuYaXpxjsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eemRY1f9; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eemRY1f9"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52c4b92c09bso6035617e87.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jun 2024 10:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718645605; x=1719250405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QFQCWRaqmBJq8+m4mF5hIPHwI1FBZDEXFQrG/Y1yGWA=;
        b=eemRY1f91RGS4plsryR4G48mZYcM/u3ovmFRhDeqyKlDEZ9eRJ1eePQgRqck8D5XK7
         O3alz5IWKZJ2dSECt2gC4BuTCIpldwv9sv2IJlgCHHj5Y3x3DomKE/0vOq9XpOKmby1/
         OcqBhff9ysPeG0kz+93LThbz6FnjSpsTw0BySAflJ14pvYArOzBP19X7/nTKAWgboOBr
         Ja7vUY4xWmP8rQYWshuD2r7gCJRnnoGwnJBZb1x++JIvZV0tFaqnh+ki4w1VUBbYEBmf
         8lop1fy27a/x66K2rRbp9WAGkQUuoJbrVmnboY3U7QhYTIuGt5qfFZvmB+sl6JoiFNiq
         j5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718645605; x=1719250405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QFQCWRaqmBJq8+m4mF5hIPHwI1FBZDEXFQrG/Y1yGWA=;
        b=DK7Dr/1svk1ZIo2iCHdiVOjiagc5Pkjop1NRfK4Cb+2kVP57QgIEQ9rMV6zBWTuKeg
         OjXj+S8aCDFRF3uk1/C1esadhU36hGHQeA1zgQHkcB+Sa6xfwuOZsBfLD26nDDejAGRJ
         Nw+8/7Wjgab1ziY+IAbxipg7Wy/zGeQmq/Ju82j/jc/ZISHFluCkAjC9CqkPYp9qAjsn
         MJY9rPugi9rEQTL0EzuQjwWR90lGGTdHlbwfLwET3LKSfbWfD1ntlFhsdHlSLhR212d5
         n4FFcjEpjzz4MT9nTaR6V4Ggdr8OiaCW3PXOcZMOvzfCBEh94AKPYEHk2TF13jh3WQdh
         6/jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAJ59S2FUagqKFTZC5Dc22C0Lq6JWc33fGTEUUkd6QvUGoNwFc8/l0Oc408CuM61JFKXvMzEfR2KI/RAn9TDkfi8tct/7pAwOfmn8PLRiLrg==
X-Gm-Message-State: AOJu0YwWNmNB7I/meSNsMP6HPd7eKISa/3yQUcZv9D8sw+0lPqzssXiC
	7n1rIALpVTxGDV5sD/S2k1i8DSrkdyoYONdcyumY3kI5rEYSXPuTFbqV7EMpa5s=
X-Google-Smtp-Source: AGHT+IGZ0XGwW8+FJ9oSqx6R/jJKEbazLowEP92ZnnjcgIC15UcSwHMBJpzMR4oEGE/iPCzK3fqrvA==
X-Received: by 2002:a19:f60d:0:b0:52c:82bd:bc6f with SMTP id 2adb3069b0e04-52ca6e563ebmr6789043e87.11.1718645605467;
        Mon, 17 Jun 2024 10:33:25 -0700 (PDT)
Received: from ?IPV6:2a00:f41:cb2:a9df:20fa:cfbe:9ea6:1fe8? ([2a00:f41:cb2:a9df:20fa:cfbe:9ea6:1fe8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2825863sm1283308e87.55.2024.06.17.10.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 10:33:25 -0700 (PDT)
Message-ID: <a31a2f94-d125-48fa-8e57-7aedee98063e@linaro.org>
Date: Mon, 17 Jun 2024 19:33:22 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sdx75: add missing qlink_logging
 reserved memory for mpss
To: Naina Mehta <quic_nainmeht@quicinc.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240617093428.3616194-1-quic_nainmeht@quicinc.com>
 <20240617093428.3616194-4-quic_nainmeht@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617093428.3616194-4-quic_nainmeht@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/17/24 11:34, Naina Mehta wrote:
> The qlink_logging memory region is also used by the modem firmware,
> add it to reserved memory regions.
> Also split MPSS DSM region into 2 separate regions.
> 
> Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
> ---

The commit message is very misleading.. You're not adding
qlink_logging, you're renaming qdss@8800000 to qlink_logging.

Then, you add qdss_mem @ 88500000 and split the dsmharq_mem into two
and shrink mpssadsp_mem.

Please rewrite the commit message.

Konrad
