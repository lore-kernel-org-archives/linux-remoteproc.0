Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741CA432E79
	for <linux-remoteproc@vger.kernel.org>; Wed, 12 Aug 2026 11:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534036; cv=none; b=WTfWV2Mv5REnRADIir6NZbMQlQKlSIBaidjeif5KNjLyj80Y6acLmiz4VkSJ62v4AOhG/V4BgtTaJILNACh24TqyAur2+H1PgS7nUBFjUus2KwEugXmUdKFlFkoWFBnhSxESX1XZ4tOa1eke/ZK7gkZUOJEH+lK0urZ5e0IdcqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534036; c=relaxed/simple;
	bh=9ZhmEmmV+krIFpz/g6z0yC0mNBWXJoMobzASqDpELJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dfvEq4JNHmHlGA/KAfwDnixdS6p7fTH7U02e/y2TTHsAZf5lJHBuQD4aVNN/ayeFijeUfbGrm8LbQaLs6DoMLp5n65efdDf8Q1JSPaZ2MP4i3tzHfTB4FMREVaSCcpnheYfEnX4hRmjMvfqMWkeKQRDDxCCPD1SwmdzW3gkr8PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHCqNdTV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHCqNdTV"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so4369025e9.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Aug 2026 04:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786534031; x=1787138831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqVtyUs3B3LjBriNPXaVFL6YD2XVSQF7G6/cSzqiF+I=;
        b=nHCqNdTVDy5OuOGphaLeQNLFhcgvlxCvRrQbX1dzCe5V0wPr/em+I4J1GWq8ckEzfS
         lD+docdhDFlEvB8Aj+Gg9cgGhpZsDvu8H/st/yAlOPDYXS2IgBouh8hpC66dHJE+hTkD
         6wfUDfuQ/eDgpY4Q2gSVk3CEXi+3mCTRUFhUEFgnWpjXm9W5gio8ds6fd4XFmY+hY8Xa
         /O/bQ+Ic8ZCEDCgYO7b83XwKftrAH5kKQ1L/OoRr0fzwsTCM2HvrbY5yXlVkOiWaKY1v
         qHPpLg+g3Sfh1r5qFgASOjN/qCaG1OvaX6huE7AHXo6D2DH99Bk/8+vRuIT1mNjLU9I4
         /Qyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786534031; x=1787138831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqVtyUs3B3LjBriNPXaVFL6YD2XVSQF7G6/cSzqiF+I=;
        b=hJVlzDXx4cFfJ7K5B/pHmisH/PTY5Mm//R4Ql8A6foNEOXgrxlFwJrSxyQuTO47RVH
         ZXpgsLG+18eD3gbcZYPJkbjIO9olVLRePhuSANSiFPC26ibLfPPca4Dr6uSI2FPhY2Bd
         UERD+4k40uok8HJXEnOTcLVw5yc0+9p+rd8s/Jz1OpNy60dPcYa/60WyKb4eRA4iSR9b
         +EsJOs5O0kvx1mdoeS+SKFBXDD9VF4/9EWoPPBYB+yPnPBUIvUQJfjIyp1OA3o1ScLIB
         nh0D4qkafqBLX/zsnxVGqePjeoMiTHxbluWKiN1Yd0NU4fFaSlyR5Gw5E2PWNk3P7pZb
         989Q==
X-Forwarded-Encrypted: i=1; AHgh+RrBfgx9/6RWvoBDsXRCXxXRFrrBoM1KsPq8Io93iB1Ss/cH3+INUbmZZ5DyMjLm04kCVCS1mVPM9P3eHVItudKy@vger.kernel.org
X-Gm-Message-State: AOJu0YxcQayEDSJ5IPSPrgAHy2npAGtEin0FtEOApz0VxRwJS/OUjEFU
	slCMLBHkZXRRA2RDqXMqKW6BSX8JK0GbK2iYDmLfvDdcFP+h1JNH4DN5
X-Gm-Gg: AR+sD11FqxsSBdiz/V+/WIblQNcwgapW20FKDFqcVMyCz0PASbi7Dh9qGMxf0aDTJnU
	cIJKIvX8QXDqUQ/Wy0MH4ux0WlZVrkTf37YmqPgqkTGkZKgKq3kpRg08yYTlq9AZ2f5xocFRgVz
	z0LP3epDQIvOaew7dh4NnkKQNKth1KuiM06rAwH3a8GfzSppkf3/5kDrulQokr6NQapMc6h30l9
	FanQsKr0AIrGvpn/SqvuGoRreu0QvroiDV7LTLqTDrhb477L4bJ//4jMu4/io+AY+sP3wgZypLN
	3U6r0IEH5lJNkW8T5X17GMcSZtFl+FUkDlgVomwvXLNXbWybshguEXuN5dEoZgFyGSmjvxDyqD1
	2vdKh6TawuxJ6gf1mxsn26c76oZprlAWcGdJFOJCDfYFvZWOZKt9LPPQ2fUfZIbJjr9f9wnp3+5
	+38At8di3gYN5msnr0qhj5n8HiXSe9iFEYuONOtJL2w9CXWYnKZ9NmQmcOJ89+mNkdfnNct3JCN
	i5NKtF7HxPW7h7Sxt32rQ==
X-Received: by 2002:a05:600c:468e:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-4997c127e00mr50618625e9.13.1786534030648;
        Wed, 12 Aug 2026 04:27:10 -0700 (PDT)
Received: from [10.25.219.170] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aa3ebe0sm75222995e9.0.2026.08.12.04.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:27:10 -0700 (PDT)
Message-ID: <f4bf1557-9f09-4846-9352-18587cd6e406@gmail.com>
Date: Wed, 12 Aug 2026 04:27:08 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] remoteproc: imx_rpoc: fix carveout name parsing
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta
 <daniel.baluta@oss.nxp.com>, Francesco Dolcini <francesco@dolcini.it>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-3-laurentiumihalcea111@gmail.com>
 <20260731-sweet-curvy-lion-bf0215@quoll>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260731-sweet-curvy-lion-bf0215@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/31/2026 2:38 AM, Krzysztof Kozlowski wrote:
> On Thu, Jul 30, 2026 at 09:34:10AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The imx remoteproc driver assumes that the names of the reserved memory
>> regions reflect their usage (e.g. "vdevbuffer", "vdev0vring0", etc.). This
>> conflicts with the devicetree specification's recommendation, which states
>> that the names of the devicetree nodes should be generic.
> 
> This is not true and I already told you that at v2.
> 
> Best regards,
> Krzysztof
> 

Unintentional. Forgot to update commit message. Sorry for the noise. Will update.

