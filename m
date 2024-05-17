Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794151EB25
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 May 2024 08:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715935634; cv=none; b=qfLFJSPxWmcwwRN8IE4GK5ojD/CQKH1Xp4AumeN+hEyWFgHhADGrCYrF68ONLqY5zg0x7lBDoHc9ojtD0QAP4QVZcquQMUmLiozllzz2lV+gCeLuM4gtCc3FLyGQ3LbKrElilfP9A74K3QorB6t6f60OntcTyfL4gbswtjIWyv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715935634; c=relaxed/simple;
	bh=4OdmYv1WRNhO/gn86tq8/H6wXNfdPJ5uk/aGer4Pte8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=koA5bW7pSFFFZJOwJ8BvZlRKDl+sbnnc6ovlxYNU2zHEMmJAc2j6jV15aTM33msCvKmsIHYZkntf4oHksmgkc6lk4pYK00/ebeGOZyTCVLa3/JYBjAyiwr373RCmodFD9/89wYCnZt0CxoCk5b9WzLC0B7fQ+uw0jONaHow5AB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xeaiurc4; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xeaiurc4"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-573061776e8so4526994a12.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 May 2024 01:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715935631; x=1716540431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BNXEI5RgnF6KxXraKabW6jmWWMmCoWMSZc+WDDccCZU=;
        b=xeaiurc4gxOUkPWGu6Poj2aEnyt1rEba1IKvACCEjDS3jZxIekz+E0KxJ57LbA8Sne
         bG9xhuBxB9Nx/OogkX6FwSRP7oZkamnEBkdtTK6zYoAHHvsFKax8QpHXB5fqUKYdP1yW
         gAV6SnAA8Zb8IYbURDSObhiaYeYsMB4Kp8p0vWlaqfIC5uylNkIJi2kCv6OMGngLyU+h
         2yHiqH83OdVObPQUU3ZFrtVextzKP1XXO6mQBTrC3AYjlQWhRm+nY3cRdnGSOVqetF5F
         eZZmIPdYsuNC06t1vJfIcBwMhCJsbLJfFWZPPzxjjvyiNLasqkTh4xeFnLS24++7Mg3s
         13Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715935631; x=1716540431;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BNXEI5RgnF6KxXraKabW6jmWWMmCoWMSZc+WDDccCZU=;
        b=xFKXfkbymyABP2vLiOjnX0GRjTf4p8B5diRX+P9TvVNYXraGGebs+idBqdrwCUo9vA
         B1BMg82j9XEhRGz6AquXqvcBY01t9B9MikuOWO2hgsuZuzMeUZeh7v3b3RlL6sdlpDz+
         QGt5IqG75gi/gae0cJoeVKF4CfNj7Cz1Thi8xHDSgq/AsKew6Mj7I/RYmQSQCG7ZuKdD
         X/4ShAQEpOUYaz3GX0QrTusBrYBeHxm0LCZC7iuw9M/hPk+/Uv/AXymHRK0BZCip6AsS
         Vyq/UTmiyjc3VRBOiE4vmOrRwVjTl1SqZPq3WogCxYkgHlbXmTMedTYeQqkt/H2nEOUW
         K7QA==
X-Gm-Message-State: AOJu0YzPYuZEPX26hhFFYxNqESaBAss2Rvz+8r5vlYChcGoUD1N1TEki
	9VOzx4/au4vjMbvJzCReNX4BUWb+RLnWhXg1bDugKypfbJgARWsbZGNOw5Ql++0=
X-Google-Smtp-Source: AGHT+IEsXSC8UA8owVGxLFHqf8ran6U8r8csZ9/3h3jTJTAH+g/2KmzDOTIWwv7GrubPcDFiE5M46w==
X-Received: by 2002:a50:f60d:0:b0:571:fc6b:966c with SMTP id 4fb4d7f45d1cf-5734d5bec1amr13207770a12.13.1715935630962;
        Fri, 17 May 2024 01:47:10 -0700 (PDT)
Received: from [10.91.1.133] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-574f26d1574sm4164356a12.36.2024.05.17.01.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 01:47:10 -0700 (PDT)
Message-ID: <5a19d2bd-340b-48f0-a64b-e5003b0064e3@linaro.org>
Date: Fri, 17 May 2024 10:47:08 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] hwspinlock: Introduce hwspin_lock_bust()
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Chris Lew <quic_clew@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, Richard Maina <quic_rmaina@quicinc.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
 <20240516-hwspinlock-bust-v1-3-47a90a859238@quicinc.com>
 <77b01a97-de2d-4e10-91f6-915ec414eede@linaro.org>
In-Reply-To: <77b01a97-de2d-4e10-91f6-915ec414eede@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/05/2024 10:07, Bryan O'Donoghue wrote:
> On 17/05/2024 00:58, Chris Lew wrote:
>> From: Richard Maina <quic_rmaina@quicinc.com>
>>
>> When a remoteproc crashes or goes down unexpectedly this can result in
>> a state where locks held by the remoteproc will remain locked possibly
>> resulting in deadlock. This new API hwspin_lock_bust() allows
>> hwspinlock implementers to define a bust operation for freeing previously
>> acquired hwspinlocks after verifying ownership of the acquired lock.
>>
>> Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
>> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
>> ---
>>   Documentation/locking/hwspinlock.rst     | 11 +++++++++++
>>   drivers/hwspinlock/hwspinlock_core.c     | 30 
>> +++++++++++++++++++++++++++++-
> 
> Shouldn't this be added to drivers/hwspinlock/qcom_hwspinlock.c ?
> 
>>   drivers/hwspinlock/hwspinlock_internal.h |  3 +++
>>   include/linux/hwspinlock.h               |  6 ++++++
>>   4 files changed, 49 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/locking/hwspinlock.rst 
>> b/Documentation/locking/hwspinlock.rst
>> index c1c2c827b575..6ee94cc6d3b7 100644
>> --- a/Documentation/locking/hwspinlock.rst
>> +++ b/Documentation/locking/hwspinlock.rst
>> @@ -85,6 +85,17 @@ is already free).
>>   Should be called from a process context (might sleep).
>> +::
>> +
>> +  int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id);
> 
> I don't think this is a geat name "bust" looks alot like "burst" and I 
> don't think aligns well with the established namespace.
> 
> Why not simply qcom_hwspinlock_unlock_force() - which is what you are 
> doing - forcing the hw spinlock to unlock.

hmm looking again, I think _core is the right place and bust() is 
consistent with bust_spinlocks();

meh

---
bod

