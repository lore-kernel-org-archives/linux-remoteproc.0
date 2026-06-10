Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987A638CFF8
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 09:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082644; cv=none; b=nD1XnW5Q+C2nTdIJF87B2K7QJacF2Jm4abrxRDNVSUG98MNQhp10hwBS7fh/oEEi1E1feW/inh5OgaOlH/W0n9urs+XVsP81RWqz+d8FQkmpTRj7ErvAiBtypfMZ2up6eILSrkt0nFoinYZS4v5b/864GjhQvEu+JzjuV4EdXos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082644; c=relaxed/simple;
	bh=1u/gyIAUL1eHXRk5cCApALdPFJbXqUR8YqK8IXcgoeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iID6vrSumpJbNtqRKde/YWcYs4Q9I1mDdZ4+N/VGk9nZDTjTLrjnB1avXRQsk5bmLc24tTTf+L5iNltFBwAlr1ww/xnS1X5qGKMF2r6WaiNetzsaDHk1nMpUaeCYgr88PWTSFl9tRgw9WJ1adbd9fL6VB8cO8wntOzZfWagYHJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGj7JP9k; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGj7JP9k"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so38064685e9.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 02:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781082642; x=1781687442; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MVCneA61j9/Mv1FcSX1dBIQFass/grRjgoNTeP0soOo=;
        b=XGj7JP9k/L0bePfwvsIXassJ26bIQZ0C8DM8q8RFio9zJaXCQj9q0dFhLMWo4+PMlu
         rst6anKufe7OLTGG3hvija5XQtbKrIkGSidGpkSPLvxbD0G/koAwaGZUyOoeYIYbvCV0
         ILIguntqjiJQZECWwVt/9pNt3g8fcb6r48g3afYj/5+DQ/M5Zg5bwvzxL2iJU+91dQEG
         /XDPjc6icmzIXQuN0yeOWJP5cAIK+WMQSpPPCfykHXReyay4VcwONghYUXqJkrxIPVAo
         JagpIFNjGFeeOYcHSObDh9igJOOX34lNrfAeeYo45EgNl6Iuq57yc6YXZNIKzc+RAsVp
         fNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082642; x=1781687442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVCneA61j9/Mv1FcSX1dBIQFass/grRjgoNTeP0soOo=;
        b=R7YfCNLePxdOLgeyiTAxASgkdKV9iXowIarSB/TUAmESuIX64uf+3LvLHKTUtjIeCE
         NStUM+iw79kXKm90fVaLeNu4Kdg7vQRXRFfk8OW/lnrNkI2yzeRW55XxwyIiufyBvjPs
         93g+JtI30Veb8HSREHDztLt1+dvm+4s9E8rMidj2gGATmqgJzjw6An2bNGKZGh6eUd65
         u7D/g+lI/MOO68TVCV/96pTyol1NQyRRnz/p0veweAA2dsKddk+rd+fQaqJ2HQT+/4NH
         D0hViC3MB3HSXjdMKo/Q/VgWdiD8VWrRRVJeEu+9sruyz15P/3I2ZO/LIyrfLR+Ya1ok
         afsw==
X-Forwarded-Encrypted: i=1; AFNElJ/SRdBwyiFEbjZTjr66M/tM5rB7KhoTy5s1+gcFw9m4oupnHsxqixmpbLZmGNijSg+884CgImekINzZpvpEe+Qr@vger.kernel.org
X-Gm-Message-State: AOJu0YyuYPusiQB+Rpm5BtonBbGltYNNr0WUOChnodqQZx/bTaIwevke
	nmMeNlavwQozx9lrYbm8WIIVO5soUyCPLN0wNL61vrWgolS6xajJrx18
X-Gm-Gg: Acq92OFjB3aVwVr4hyIsL1ZHQE6zwejZv3Y8cTDPfSBPqwLCoYkvmblAIJd+bCJPQrG
	BZnJywtb0zxD8mVIlXSDS7lPpSNllV6NXqLeMOmPT/Ln7UBA37UHJo/uxqteqneJg+0Y/ruy7EB
	+ykHcuzmeTOXuZyH66CX0gAUzWXV8yFwmPtpeEka3IUn8scTmf5es1a+cGsDqzilavqoGSJkyv6
	169Uq+D5EHM0Yt2PIX6o/YDtzJ+igrJ5QwLmKGHuOhRdDL4RDatjeFqhZeodimPC20GqGJt1kI6
	GcF2qPgvOsPl+/mnqMIvPfyzom3Ku7wetVZXY35Ze1i6Emx6R21WdLoFIuzrvU0DNhBoNLZ0Qvu
	oR+z7Y/mKfQeDYw0AADqHRRbyec91c9z3t/OyJ8oZZM4fN9Xl9H6ryd7+bd+dgtzYxZq3ABlOo/
	4LohTM2cf/LGNLtSSmwnz1H9hKzCdP52wffwmsRVPXoOzXM0SLP3+vcfQg+DRQFqOSQVQ=
X-Received: by 2002:a05:600c:8518:b0:490:a298:3859 with SMTP id 5b1f17b1804b1-490c4993bdbmr423122135e9.24.1781082641859;
        Wed, 10 Jun 2026 02:10:41 -0700 (PDT)
Received: from [10.25.222.173] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm579850645e9.1.2026.06.10.02.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 02:10:41 -0700 (PDT)
Message-ID: <2fc48536-5af9-419e-b4df-746b678cb6ab@gmail.com>
Date: Wed, 10 Jun 2026 02:10:37 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Francesco Dolcini <francesco@dolcini.it>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
 <20260610-adventurous-granite-marmoset-e0eaa8@quoll>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260610-adventurous-granite-marmoset-e0eaa8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/10/2026 12:37 AM, Krzysztof Kozlowski wrote:
> On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The names of the carveout regions are derived using the names of the
>> reserved memory devicetree nodes, which are referenced using the
>> "memory-region" property. This adds a restriction on the names of said
>> devicetree nodes, often bearing specific names such as: "vdevbuffer",
>> "vdev0vring0", "rsc-table", etc... This goes against the devicetree
>> specification's recommendation, which states that the devicetree node
>> names should be generic.
> 
> No, it does not. Names like rsc-table feels exactly like DT spec is
> asking - for a name matching purpose. Are you sure you read the spec?

Quoting from the spec:

"The name of a node should be somewhat generic, reflecting the function of the
device and not its precise programming model"

and looking at the examples provided in "2.2.2 Generic Names Recommendation",
wouldn't "memory" be a more appropriate choice for the DT node name instead of
"rsc-table" since it's more generic, while still matching the purpose
of the device? Or perhaps I'm interpreting this the wrong way?

> 
>>
>> Fix this by documenting an additional, optional property:
>> "memory-region-names". This way, the carveout names can use the values
>> passed via "memory-region-names", while keeping the devicetree node
>> names of the reserved memory regions generic.
> 
> I don't see how anything here is fixed. memory-region-names has nothing
> to do with node names.

The idea here is that the names of the carveout regions can now be passed
via the "memory-region-names" property. Previously, we were using the DT
node names for that.

Thus, we can now use the more generic "memory" name for the DT nodes since we
no longer use them for the carveout names.

> 
> Best regards,
> Krzysztof

