Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A076392838
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2026 15:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154711; cv=pass; b=JFv0TCbdLzQ2FD7ruEQy/5ibssT22/8I4aKBZiL6mOdSRx+x0ZGK6BnI1R/S884hCuq/JeV6epn2TWYEQk1s2PuQBIPf7k7GpT6rynf+AFpTKdtvu7G2emqfWGRMBwVJyiMUC4ByHKePFldnIPqrJ6xn5BjWmwysBzHzuA88jr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154711; c=relaxed/simple;
	bh=M1gPc2bvaiQxb6vPvYuvFaGv1R/+I7N9bwofWz8Ps/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ET7I0/InIs2yuG0onYETJTzmcogOnXfBoJ5KSe3DdWnbSQZvllYNA7NmH1TRAdKx6gnokZfqBkZxE1tIN06v0aS2xmJXwGVULbmc47fjYu9Nbz/j7fVPRRO5IeHoIvaBnClGJCnQAHvB8xz5/cNrFdh1TsYXpz/zn4Og2/Dsu3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v2cxfMV9; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v2cxfMV9"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a17f91so2046947a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2026 08:51:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787154709; cv=none;
        d=google.com; s=arc-20260327;
        b=n23KfEvQbhzN4GPtc3Y0zOMKEWcUYFZaILcXAAm2Q/1LlTptt+RcAdKx2gsiss9LOl
         8E98P2lrmjHDQC8U7xiiE/gL0Yif/U8NrUzvi3aU0nH92oU7Wv++YBmK8rdtyqP8IlG+
         YDJiWi+6ITLV6LDqRvKKJs6H2vnxOHQzg/8XArGThYiXKDUEwNhTmHrpKfZDOxMazOB0
         RuIa9SybauSbgm26lF5MtagdLntJCVbopYoAzgMZwBHExyltNP2fq4ypzwSOyUoeW2V7
         N/PUdh0+W6ow2G1j2iwe2Pk3eipvUDMuZeQcmzyJTx23FOXx64J3Uqawigds3NzBi4Nw
         s5RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FabclObMJFzoWdO6v3shf/pjOMMfD4e/jw+3OS9LCWk=;
        fh=wYVpeM4+t4evSXeecNnGuyj/H1XD/CR6cFyfm1+gzIo=;
        b=mYZhqwzG2yov0MIEIanggSJypMbH960UMSMYyj+Wsi1YPQCujufJCA8zC29I8qiHjY
         stihIEPx6GKykL8S8UkkPlEv9ibkcd0h1G0EKwHusRWtpHy9XZb618O9wbqb6npoFRk6
         E4akaMgMTPRaAZu59Li5E7bSqOEo0Ke2KL+NZ2gcZf/zMzoNRg+Q8NGxl+LS9lzkro1U
         AVbpB/RGcfbEPV1NG0KM2I15bovZsnA6dPeOFjP55i5QPerKPhf2GLL8KR9WONrCgebj
         EFape6u0G6BjLL+dKG9KgpKdaRBt+3QSB3PN8uBQIyCmzjYULdVpLB5EHr2wg9i0AvTt
         /BVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787154709; x=1787759509; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FabclObMJFzoWdO6v3shf/pjOMMfD4e/jw+3OS9LCWk=;
        b=v2cxfMV9dmR1TC/N50BGwg8O9M5MzbLaiZRem0gN+mjlwJZ2SVxhiU7A3U4EL34rVz
         yeNmqPIWWvFWoS0T6a+AWKYm1jzDvL/V+8uMdApVARpRSdQYb0mlEpFseiyqlGE/8Ws9
         SNlyZaet6XtwN01wxteLI/wNx3gFr6wX//bma5aW+COommN0JrM0b5Hlx8VhwQTaCWEX
         VPowmLzL7PhdEwgj0HoFz8xuqX7ybN3bFdIkhfRkAijvTH0ZOZBrJ2lC3N7Q8Jmuv6aa
         NPJOUbCwE05+4GxibHxoxyCsC9JOdTeeiFYwwCSxGA+e5MYl3LYkm/sHVffBHQmV7c42
         iZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787154709; x=1787759509;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FabclObMJFzoWdO6v3shf/pjOMMfD4e/jw+3OS9LCWk=;
        b=qx8PROjBJ0RN/D97Cnj0fHbF5UI/r46vjmaxfibP3TZbAzHAtuh3Msd6u7uhZAH4Ut
         sQIhzP8lp4rO7eIFy8oDRwZ+Ib/K4SUIIfJjF90FBF5HpXWP+hasnosRgHwgpmrJQ81J
         EmNALhJrykANbvXuqmYmGHHd4ahTW48tAJ/iK4YHEfklqOBQ++zGX3Od3j8QQSYm0Fkg
         b+2fDHBv/Q/nZziAO16wTFCv9SQ86OBFMLUPs1RhgUFvUfPI4cw1jdwLbbUMlE1iQvBl
         V7mRPWm/MYC1yImA2lD3dYgXD/suJcuhASB4Zb3C6IaduwjVK6LbNMXxouc0N8JQiJta
         LVWA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5D7ZqHQY4HLO4qFNGBU90JtpxU9Akr342/sR4XxU+ctqmplIjn/Wl268jBPcYYG1aTt7Q0pXJ8GkfRHE2ww/8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt26Z7J9fdc7IHcX9FvXqUs7wvyOXuDisPnXxSwhESYecFt2LT
	1Jo16qwhtlEGR0TYZKHjznUzKYVss1Tjmc2rnMpFvwWPZtknhRSnuzMe9tAFEoSnX0xZiwPnkII
	JXroBgfczHIQOAnfMsMUarg0us6JIzvbE4rL8+mIRjw==
X-Gm-Gg: AR+sD139boMkeJDhbeFxb0uhyQADF5jFSQzPic5VlU6aSQd2nXg2UmW9tKn0soROVJZ
	Ma0dIzmGhxYfuhlbPg6Vf6a5wcK43t84gwXMcTq9MCRzavKV4nIDRbXLTDAjapJzHnRusP6nWyf
	seaXxRDm2X0TQxjUfojNACYd4eCwWZJfUrxXk2eBC6k9OzftalDuhSPP9nri4KK9u+XnQe0QoO9
	zEOLbu2KhqIvefIPdOswknVXD9vpYe+vy2dKgQ6nTBatEV6YMbVpxkbVedaUjazZ5aOV4t9hLw4
	iOCKsoj07+buzkrTDEcSfovkbUJARlnaIweKxd0tPCiXv0rl0qFzIpnb/VjvT1EuGhXEzDhe0oT
	korA=
X-Received: by 2002:a05:6402:2422:b0:6a3:867f:edd0 with SMTP id
 4fb4d7f45d1cf-6a4032a68a1mr4118517a12.5.1787154708670; Wed, 19 Aug 2026
 08:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818083506.79567-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260818083506.79567-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 19 Aug 2026 09:51:36 -0600
X-Gm-Features: AcwNN1XRTsmCPwB72DvdE_IQEeyvcZekdfwlWqyBEHToVcymOI-eY1KBrpFJDYU
Message-ID: <CANLsYkzzzooMBri9_BbSavFE3h_mhMzrjCU6+Y22fFC6SrsPcg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: ti,am3352-wkup-m3: Drop
 redundant reset-names dependency
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
	Bhargav Joshi <j.bhargav.u@gmail.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Aug 2026 at 02:35, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Core schema already defines dependency of reset-names on resets, thus
> code here is duplicated.  The only meaningful new dependency is reversed
> one - resets depending on presence of reset-names.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml        | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml b/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml
> index 9e8a03acdec4..997be06ceeb1 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml
> @@ -62,7 +62,6 @@ required:
>
>  dependencies:
>    resets: [reset-names]
> -  reset-names: [resets]
>

I'll pick this up when rc1 comes out.

Thanks,
Mathieu

>  additionalProperties: false
>
> --
> 2.53.0
>
