Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B30130EF71
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Sep 2025 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908316; cv=none; b=NRPmoEJPTQin8neXjWV3jsLQ70xRaIjjQGwizxYaR7C2cCkn0KV5KDr58zKEnI4IbuBkmtEnP6orvBRThDNMju3onF4xyp09P6gPYzTG2kE7IrcfCSPLBnxEZZ4HA8srrstk/FRbU/MOFDnw6nFpRnsMhL3ILKvHAT3JLg5FBI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908316; c=relaxed/simple;
	bh=p1lxtpJ7TjvFoHPJ/hZ3029ZCfEe68+gdc5pXFuSGH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXyTsoK8BH/vZqHrNfSOXgmcm4jqkieSIPOLcKSmdbgStQhCalas/2VlL10Ka8Sz5xrQCGx0pc6zCrlrwwZtaEaE9ugqUkcN2CehfB3dDK51QNSRJs3ZXllzjEsyLKn3UJK86gFmnWxd1reXiMYmFPjhkeAcKb4ExeKXDtTFLfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s6A0lRSQ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s6A0lRSQ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3dae49b117bso1579866f8f.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Sep 2025 07:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756908312; x=1757513112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QK1Plguf59MohKiPDL9B9tJ9p4M4VouT3+3TgzQ44t8=;
        b=s6A0lRSQEJ90tneUCy4zUGJz3L2E5jUu9WsMzIfv6g50o0+H8hjACes/xhJphVACrJ
         wY1XRLApmYh3RopjnhuBLvNY3qAYVViMH8S4T2lxPJTesKnZsjZiSxvGQlqw6MOLlZAd
         spHHgGYKFIqxBJXUa814BPmEowiwB6LyLnJmS5ReefQgeKwgRzD8qZY3cALUKn3qHYc1
         fBwZboS/iNUwRVy51FHS0tecA5Tr0p5Fi/fZEynI2SpJpN940MLe/WzIso3NlGan5fXc
         yPpYUIvYfnSNLVtFdXcWmJv1TshOwEhfJDkJobAuuFhJkRNvIxBDQSqsMlkOBGZnZn7s
         RHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756908312; x=1757513112;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QK1Plguf59MohKiPDL9B9tJ9p4M4VouT3+3TgzQ44t8=;
        b=TJQ4YOQUJ2ITmUYhC0cv3WUmYkcJGe9xQ/wtgV3vASVjjb7Gz4hAYQPqCgAvDXz3uE
         ZBjixt54DaIOwGqhlR/9jtjvpFdIbdld0OY6Bv1LrNey6Lc7jmxvIiFxtxP3eTQ5jGyY
         kuGud/ry3vCljReSLfUWP8am8hjRVS0VoAkZMDFlgE7FPm2x6BoRaqG7pPn9/WNUu3fQ
         X5D2vJ5gCtqr4w2vyBgItyME/87Nr9Dt4hP7Ic22x9zDKF5HQigPQf57IGkDtRqVF1iP
         DqBigjLrT6fts+5DotQtRbC6nsvjJJUaOq7ue1BZI7bGjfsR5pS9lfh5kpLAD68YhWG5
         3Caw==
X-Forwarded-Encrypted: i=1; AJvYcCVhqkZLaBGqoBd9DfZjdkh/EWKpDMMRO3e/KAN3LA/vOsKuFlGKQKnpfyb7TwoitOecVDx743v2XYIYH3s7jVm5@vger.kernel.org
X-Gm-Message-State: AOJu0YyKLyGFVm+AM5W4Z9Z1vhcs9xF9KLnQuGptnsA8XeKA9gK2nQ57
	RujmepAsnGSSgM5XxyGkJvEtY60WBh/vyIPNdh5B9hUzYbOsdkgXfOPAr1VEM0XIN1E=
X-Gm-Gg: ASbGncty0y26u/ItksRyx4xOVgF9cBkl8bogOAwc7pu+3NMtgdCLxKGg23WvMOnfrqb
	Py9Mosm8p+6AooB1spQyEcD38EY9eBkT1Z/Y4qz+6AixKH3hDOEMfvk3OXsJ0jCmRrxsKzWVulJ
	+RGtsS7z+qgDwSaJexwHAv7I6i3wgsFwmP8Mx2Wm/echcuwK7Y/oMAZvKSuub7RsZtUkWkfs2c+
	uUk+6NNKRNbmI0H3WDoi+wZ2dro4sPdqHaDqC8Y1dx/IzhXOAxcmDAJqhl53RRUb0i3gvfCIhGe
	rSZYxOq7oWXdvT/vkZ31qSqMw8VRWTqojoTXq5wGfJg2JVITnQLdB/yFBndQhU0qAmKuzV+FivB
	u4yQ/Hxu98q1/zcWHq3+Hl3mZDIGGdYYdyKFYI/a/gOgixygKXF0DHCJXIHsJY6K5Z5B3+31UDI
	FHJUjdzc4JxgiGCRIdpItWrIcTUShahQ==
X-Google-Smtp-Source: AGHT+IEZMZforlja2xX6xreLhIbpAVhCSknwT4/G7zI8fcA9TDR7jhhzcqogfHqvrdx3U1dTW1cIhg==
X-Received: by 2002:a5d:5887:0:b0:3db:f9f7:df86 with SMTP id ffacd0b85a97d-3dbf9f7e8d7mr2886230f8f.61.1756908312422;
        Wed, 03 Sep 2025 07:05:12 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm323422865e9.5.2025.09.03.07.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 07:05:11 -0700 (PDT)
Message-ID: <680de02a-6592-40a6-b25c-4d8fa85c4e81@linaro.org>
Date: Wed, 3 Sep 2025 15:05:09 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
 <20250820112242.usd4sdd3avxdlcas@hu-mojha-hyd.qualcomm.com>
 <f5582304-8f55-4c3b-b752-9cefa1e4df96@oss.qualcomm.com>
 <b5a0ad0d-ceba-40d3-a111-0831c4538cea@linaro.org>
 <2g3iwc2en6wh2ucrsth5ontzdwqr7tr6oplxjnfdjsy3lwyyfe@l76frwiadgru>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <2g3iwc2en6wh2ucrsth5ontzdwqr7tr6oplxjnfdjsy3lwyyfe@l76frwiadgru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2025 15:02, Dmitry Baryshkov wrote:
> On Wed, Sep 03, 2025 at 02:31:55PM +0100, Bryan O'Donoghue wrote:
>> On 03/09/2025 12:56, Konrad Dybcio wrote:
>>>> Can you try with this next-20250814 tag ?
>>> You sent it on the 19th, so it's in your best interest to run a quick
>>>
>>> git rebase --onto linux-next/master $(git describe --abbrev=0)
>>>
>>> and giving the series a prompt re-test before sending, because there might have
>>> been incompatible changes, whether ones that would prevent applying, or break
>>> things functionally
>>
>> I can't even find that tag next-20250814 closets thing is
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tag/?h=next-20250814
> 
>>
>> | * \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   00062ea01d35e - Merge tag
>> 'drm-xe-fixes-2025-08-14' of https://gitlab.freedesktop.org/drm/xe/kernel
>> into drm-fixes (3 weeks ago)
>>
>> but patch #9 in this series stubbornly won't apply to any SHA I've tried.
>>
>> meh
>>
>> ---
>> bod
> 

ah..

I fetched -stable

---
bod



