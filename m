Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EB9288537
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Dec 2025 18:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766256291; cv=none; b=Albe14ir59Y9MImf1KCDkTfps66CQLpueqZ5fopUuLXBdhdfwFcdIdZCrIiCAIIk4efH7j9Jg4aBk3CF3YRYd4Pty8jS7xxLHZ9niEC1PgUC1cNQr6iXT6T3agATe7+2TdpcmGYJf1D7Xv0NQjiFQTYOnofWjj6XxH5TCma2C+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766256291; c=relaxed/simple;
	bh=0u2OR6+3xMf4RaABwsoKlyiauVyQSZz852Zfxxk7a4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UUaJIs0RDCSTCxcbPnCvjE0E1wB/8jVNxqLXBSPnSwhDNwzPwQlLjcqR+o4EjF4KKAKaABK7NBTE/hFbiArAUSEkAeid9jzDNDvy/qd0lSXDy17SxJ3ibI78/Ep/OPXbxmGlixBHhlOKFRiym+fMltJg52wbJl6grDzREldv/Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIGw/LOc; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIGw/LOc"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-45090ef26c6so869017b6e.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 20 Dec 2025 10:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766256288; x=1766861088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trzEivKudx03y5CGgz9d9cZqh7fqV05Hs29kec+vigA=;
        b=XIGw/LOcQs0At3cxgGOls8uuMTpcxxwE3ZkZDS9O2krFSnDulveLzSaS+XwaAY5ORI
         Fat2H+DWcrhcPB5+1+ZDv2pHAdg/TCfaH6f1rHOHRFVeq8frtfNFIfiyH6lVUxmRJVr/
         /KN2ychqdgiq7ffPPjrkU+tYxkxOXS1tKIIYjO3t/XFVJKxe8IahzDzwk1Dx14xyn7Jx
         vSirQZ8fEmQqPvUdBWKxZ+q9HaVQVRj9K7tGUvhT39kyHXxnYX00SeIlWwRubu3MdnOn
         /eg2CDgL/OGTDq5OIGaTrU49wtpaW1aN6eUookttsE9IYqwwK/1JsHXutbDR4vWo5L1Z
         tVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766256288; x=1766861088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=trzEivKudx03y5CGgz9d9cZqh7fqV05Hs29kec+vigA=;
        b=JDIHDk1dkUJIJQXX5CUtw5DuvmBEFCmjJuuTs38Y5zjhzAKWhMTTqFkEURPtHIv7aX
         xm0/rE9Whs5QOO3cfiLG7PppVRH6MyDcHGHylN9A8ArZpPizcQXWcckzUuow4DQ76y9q
         F3Z26dCVMwUSPJL6v/StpIlmZHT5KgthCx+Pd5NGTYOZQLZRKwfv28igFEbrTkznEyLb
         blTm01kB/3Lwr/ODxShIU1baCI5KD924TvzMMukn4KZbmuZW2AQ7n6BjrgWhcfFy8uUA
         CWQ5iEH4Y9VlrUhBvsineLrajodTcNSe/bgnS9ylioP161pjElICR/en+LnDhue1mrfi
         e5Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWA4540jinagmXMcrAdNVQdTSzJrWDcjDlcWNcJiqClGFx/2mgqu67TqBVZ79PE0VlLIlv3UDx3Nn4EmywB+p/P@vger.kernel.org
X-Gm-Message-State: AOJu0YxCkrpEQVHk6myQZJcv05bbHTdQWQ1fWLk+rEFzASYp2pGi1fd2
	aFZ1+90uDjFsNIhPG1amtI+V8mh206F2ZgAycMv06TCTsnWaWPP4xjmH
X-Gm-Gg: AY/fxX6ZdqNd8Oy18M3yFHOj3LgdJSYaew9gId43AceJZLYnWnpcjRmh6ltkrh9S3wl
	j445hSOP321kdriPgim0G5aSFu3uxVLWCO4898s+GcNwtaQzBKfgX2e3mmp5d+JJv0JbjM9h49Q
	T3CVQVQhqpsqrGcAr42EW2PYwz6D/7D7HAixIljhm/zqwvWFrFvO50TxKxoyOkQg5/v/GhYQCPT
	gnqqsul5UkAPms03+UHVTlt92ga9w1ze1oGNUvljumgWLwRKygSQuGtwQbeFw93mYj0nnJiFBnV
	oCKoqqLdo+Pb6598fmH8RGKQCBQsRMgXIUX/pAm+5mmXRQK2c5UuQ1eP9MI0iTaLKDJLm6bJ5St
	RuT9Lbyvb5heVyXLKSKRs4Yl+FQd6V+7bekCrNuh299/Lb/4uefWSbUXjfHYiAK4aFF8UauaX8K
	3t1eOv/teay+ZaMpKAd1rA3poWx0pPUaE1LQ022kucLdIuTYdZWTjGyHF+QfgFuihiF4gPWzyn/
	pIpPFzo+GO0m6B04chHXbbvR3Tw4oc=
X-Google-Smtp-Source: AGHT+IE+0LLix2qQ2hee63jPrCqkAnrGvkh7ErNz8WY0FuIa+u/gxQ3Xhw28APg7ob5GTcztFxFk3w==
X-Received: by 2002:a05:6808:1509:b0:450:44b9:68e0 with SMTP id 5614622812f47-457b20889c0mr3266072b6e.11.1766256288542;
        Sat, 20 Dec 2025 10:44:48 -0800 (PST)
Received: from nukework.gtech (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3fdaab5ccb9sm3623838fac.10.2025.12.20.10.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 10:44:46 -0800 (PST)
From: "Alex G." <mr.nuke.me@gmail.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, krzk+dt@kernel.org,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/9] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT
 schema
Date: Sat, 20 Dec 2025 12:40:19 -0600
Message-ID: <7075845.DvuYhMxLoT@nukework.gtech>
In-Reply-To: <abec3933-279d-4111-8adf-a2e1280ce0b7@kernel.org>
References:
 <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <abec3933-279d-4111-8adf-a2e1280ce0b7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, December 19, 2025 8:52:51 AM CST Krzysztof Kozlowski wrote:
> On 19/12/2025 05:34, Alexandru Gagniuc wrote:
> > Convert the QCS404 and IPQ WCSS Peripheral Image Loader bindings to DT
> > schema. The text bindngs incorrectly implied that IPQ8074 needs only
> > one qcom,smem-states entry. This is only true for QCS404. IPQ8074
> > requires both "stop" and "shutdown".
> > 
> > The example is to be added in a subsequent commit that adds the
> > IPQ9574 binding.
> > 
> > Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> 
> > I used my name as a placeholder for the "maintainer" field. Krzysztof
> > mentioned to get the "SOC maintainer" using get_maintainer. I don't
> > know how to do that, and I don't see anyone listed for QCS404,
> > IPQ8074, or IPQ9574. The bindings apply to any of those SOCs.
> 
> the soc DTSI file 

Thank you Krzysztof! That's exactly what I needed to know

Alex




