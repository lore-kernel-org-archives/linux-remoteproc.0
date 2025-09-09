Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA75A2C031E
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Sep 2025 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426635; cv=none; b=aa0OEIkE6rtBBttfO0e4mwLbbGBPrnRon2hnTwunr0Wdoaj+Pg3/0UrMIQYU/9xqgXdwjWpvJ5Omyx9i272rDNrtSaMKIohpdHQIzlN/ND2dHAVq1xOb+7HueJ8h1UbhwrKGnlYjw+ZWWVk4FWC49WUM7n9xpy2ffZlA+4MCGxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426635; c=relaxed/simple;
	bh=J1iHTeiWgzsI9TOKXMSPaiARrb+BL0MsqyKSqGCw3KE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lO0uDx7bbRjXZoN6kkhdYGwe7gs0oGrpm4bcHAFm+m+cTO+S+euj1VWSPJUr99VWTRrk108E7z0+VLW6l1PtYU8TM0LReLocYqw/+5n5mGlxzWYriMZ0BJrd9gFSMEI1VQ82yOTskH2CEwTQL33ZG/iOiKIIMZJFPg0wIzy9FaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VIX29CZO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VIX29CZO"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45df656889cso686505e9.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Sep 2025 07:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757426632; x=1758031432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7czbVid6QRsjlwt+fbJOY83TMvm3D218edlo4P0mSo4=;
        b=VIX29CZOHX6QxDwCK4rR3x2VG+wKMskd+pE/0xRq4AsQcPZvM0ceskwVJhaen90Tj/
         xrFxolmgya2ZSY8l2ogSMjPJLw0zQIHUWXoAUS87MHq679mknScJoWPphOZEt9s3TfXh
         MGsFeS4dF7g7NBISoYPKABGARcZ2JXjHlV2d1+iUjbCpW/Oamg4hclQqxvpJePztdgBi
         Ho45LwOy9erQuSxJiGwZuchEJ8BcTwLG7NLshNZ2vSb7W/Vl2LHkVgSu1C5+UrdtTGR/
         BQJqQ+mFGS2Il+z045A/lVK3iU9QZQpuuEIcdNqsE75H4PqJUfE5OFx6wrwkHuixxr0M
         EyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426632; x=1758031432;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7czbVid6QRsjlwt+fbJOY83TMvm3D218edlo4P0mSo4=;
        b=RnASfzK0S5/WWwwAr7fu0PNtaKdsnh6DnxoVjVCFb+l6fBgqzbt4w3umDscji0tagF
         rO/5FAebouPqmnaJ4zoZEOPgCkpx39sOECgKgwiwS9luIUTnwwhnHUJhoSUwL3Npj/rX
         AVt7VjCs8pWGvJFXkZmolHD6wS+G0Ac+ncXx/3QUIqZ9U+svll0AI+aHDQufzCsM1g6k
         zQBy0oGSp/+jfqzjAQFH1Bkf+MCWBN0L/gE5zHc8x2ck+NcnbukGq6PkrrQsHbxCoDtA
         6W9iLR3BQl4j636axKOQ91l3VVF/UpHO5PYxyceVbsWW2VoP97m+fmV0du14S5PPEYPQ
         CzOg==
X-Forwarded-Encrypted: i=1; AJvYcCXqMJJX7hXLYtxJ5NUCiQbCOxbjO/bdqrMlczNfzFi2mjT0zzCWTGFtYQNvVCovB2AjisKTKb4YjJMdR4Jy6LTo@vger.kernel.org
X-Gm-Message-State: AOJu0YzSFo6OnUUXxPEDmDGRihObicab+O+7YrUooSm6PC/QDEOn2rVJ
	PXWym6Ol5pc1vdxJK8Hl+gJaXa2N6kiar9J4KujCcYCXrOmw1DVA/n0ZxdLvE7o8EL8=
X-Gm-Gg: ASbGnctzHTAAN8nCD6Jf6GBg6MtutrYMyaXzQjqiFO2eJnLV2Viqgw7I8b13tqlN8n6
	HPLAXycTxQPLXk8+v++6rruenHbcznJl8j4Cc3cBm724DV9kL0Xl4W+8MJEzrDhPEfbIUZ6Ch6V
	QA1q2PulrmEgELGzjLDYWAkuRmXJJMaiKtQA05bD/p2rkpXOvLC6MZx8WOtx2I71Tdg2sMpwDHe
	Aelz/Iw6e5VmOI6m6HcUfDLP/xQyg8UloNmwlczMGCJrBhNkKDaKLAdeBZPOpH7VHg1U+L76QAv
	JfCkIW0bF0bMocsDMWRJLWwJP8cAd3bh/ULn4+BqZpd+7EH1DBSx4ihbIF1I1LJNhvMGbmV0ZeI
	/KrRPy88ajVlfOg8F8Tak12HDbbVrq9IgkytUMWGTkGNOCOsiEZjO3SgoB9fHUHysFV9zpejwIW
	O5uhZXBWLKyVVAAsj7S6Y=
X-Google-Smtp-Source: AGHT+IFzn0c/ZENYPqzsIDea2ndHdK4KGIQ+jsE0Z5szl/BL4biM07CIyHZ1+ufaLZRPjZ/hkQF40A==
X-Received: by 2002:a05:600c:4711:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-45dddecd454mr96743385e9.21.1757426630421;
        Tue, 09 Sep 2025 07:03:50 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9ab7c7dbsm309084955e9.11.2025.09.09.07.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 07:03:49 -0700 (PDT)
Message-ID: <ad5a58a6-2545-4429-9388-e8ad84319570@linaro.org>
Date: Tue, 9 Sep 2025 15:03:47 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
 <aKXQAoXZyR6SRPAA@linaro.org>
 <f25b6cb4-666d-e3e1-0540-b2d7fad86407@quicinc.com>
 <aKguXNGneBWqSMUe@linaro.org>
 <20250822150611.ryixx2qeuhyk72u3@hu-mojha-hyd.qualcomm.com>
 <aKiaKwkpdKHSH9YS@linaro.org>
 <20250822164030.6gubbs24raeg6kbx@hu-mojha-hyd.qualcomm.com>
 <aKooCFoV3ZYwOMRx@linaro.org>
 <20250825111956.5x4dn3uguo4xmtss@hu-mojha-hyd.qualcomm.com>
 <aL6Sg9dExKfepRKM@linaro.org>
 <20250909121956.rjbysoylwybgsago@hu-mojha-hyd.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250909121956.rjbysoylwybgsago@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2025 13:19, Mukesh Ojha wrote:
>> Have you continued working on this to unblock adding the IOMMU needed
>> for the IRIS firmware?
> We are discussing on this internally and if this can be taken along with
> non-pixel case or not, will come back on this.
> 
> If it takes too much, will drop video support for now in next version.

For preference I'd rather get something that can be applied to -next so 
that we can enable PIL loading on current kernels instead of waiting an 
indeterminate time for an iommu non-pixel resolution.

i.e. we are better of with stuff that works now instead of gating 
ourselves forever on a fix that may be months or years off.

---
bod
the optimist
