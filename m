Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E213594A
	for <linux-remoteproc@vger.kernel.org>; Sat, 13 Dec 2025 06:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765608525; cv=none; b=EG966QJvsZ4eUFqvssa3Wrkpr2Odd8bly8pY+4UMwVHV0IRoWx0VmnN5gwZPzB/F3qQ4CbMzHnVAgYSA0B4Q0W9ZnVyTTMX5Klh6+834x5p0IHU/4/F3o9tZVkj2h7wuUazDErAqx69qaYZAsMnkCCaLTVA4scuZgHjeQP1BwF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765608525; c=relaxed/simple;
	bh=OSPLFg4W3QR5ByFn0Z+25izVWJy4kGkKLbWih19PHZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmTfwaRrsK5yIW5UVa02fAUIQWUZtfXfUSCVz9nVcV/bvyVI/jRGareeys770LZwc2sXCG6kb57FgTcSMhQ9Yc9d3JA6HHOuyFBVrlvOqn917k3B9CCIN7UTXZ3gPQKn3wNxuJFOIOh69f8KDq70MR2buEifuuR7FP0AyG7/k8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V/rv/PvX; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V/rv/PvX"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo2211577b3a.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Dec 2025 22:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765608523; x=1766213323; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OSPLFg4W3QR5ByFn0Z+25izVWJy4kGkKLbWih19PHZA=;
        b=V/rv/PvXawv5NhhkAlMigL5A3ymTVqMjUYFcMQfTez04D7GoxsMFc3nHxvrRxu0+Bx
         q/ag4Oils+4vYzzLAYkocXSctwh95tJIk7AfzCjE9g4pD/crZacOKcamExzMPbbSjgdU
         KpahdKnZjsNP57dPYv7jaInJnq5iLcW9+0ZWmvT2OozAB0E1wIJitV0Dv73h8kHCl6Je
         gm6vdMhqnhnrGP6jyc/R+pcvBWKNWf5P9e8+76Dii1eOMderlpgnbFv5KVQKR9ZZP1Q2
         +7GgkROGYw6lLjhmPRcJU5vV3NKGCV2mkB6SwBClNERHoV9nzTfyhH/Rn2nie3gdTSjk
         kIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765608523; x=1766213323;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSPLFg4W3QR5ByFn0Z+25izVWJy4kGkKLbWih19PHZA=;
        b=dlcYbsnlXEmDcY0smnQzha2Vz3yTPfOuq4axWdNvsACn1573yZf1Kgchc+Rq+Gxep8
         1b1Q7inSLurV94Ecg50mi+34hkC8mIYPTpiIAzw/fWHHjKVwT0iU+t2vFjSi7+Rqrf2h
         eIRmSE10cqMztgI5RpHDQ/zLniOQE4Mno+fYCASmSgirfVx8BB3j2Ff5aL6w7lyRvesF
         UuvnGBcLZB3Qn6izVE4cjChqOeUxzGH7nZxpE74zNtUzaIyYXWvwMJDQknx6DUgMcisN
         iBLiDj826WTVfzha5Omqv9jwa+h4PN+kIp81x9XKpqqN1/UCFdWlciOcmosPZukmDaDV
         7O7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUefuHwCTCIRP3AID3gy4nqrnP5V0AT2J78+orwTAxsvC/n/5n9kEa8mwplvw0gtKd7QfDgSP0DySRGDQAtYCEg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/du6PMLwsXldRJv2+L6QmM2tQnTVgUfhci8SoOctk11O9jA5t
	NldD5oKg1E08Iz3GmiGjceNNJM+Ea/Uu28VDja3Qilu5RWH/qU/20CcyMDXxYfz+ZkA=
X-Gm-Gg: AY/fxX7TQU1Qsp0/HZu+teJv4LjUX+VoZhFEutR4syaYp333Et74sRMbG6JAAhJBiAk
	iOxntrpCICAWOeq4G+F8ThpQsQeoEBQpyEBvuaJ4E/eWh1lG8IC0DEz7x2dWmnQ9ONjqoZHIVkg
	bxXuGO34KW0yrwZl2hWO7fZk2wYKU0/rCi1If8gf/QR0+Gg0NYFcH2VWhPFtVc5ilJKyxMtlfY/
	flJEALDx6b6Odlzodzhqv1tnk26r1vXD5mz1ENhgaXeisD0xbiEo4WwANNd6X7HE9TR/bjL3lWy
	R/VUVzB95MsXwaiCkRPXbN1mUEUST9B/9jdjOCzA5eFsJs5vDdm94neC2JSzZLpEg15xUWP6tZp
	kEJeHK+5Tq9BGvqju+d4EDm3jD9axTy6U80y3GOQOIm8VsJXsXsvZxxaFKdtC8W1m8sAwq0lvBJ
	tvidA7GV80BYeaOqTnEXrP91Bb5gm5YD9Tj8h9nhk0XKnAAyh/6E60HhA/mKrcfw==
X-Google-Smtp-Source: AGHT+IHwMXPg7Qn0Ef9xWbq83SFpsB1sFhZLa5C8vjkRdWjkXJZFN6bz1qhctibBoHiLjB/xaNqEfg==
X-Received: by 2002:a05:6a00:1c99:b0:7e8:4471:ae56 with SMTP id d2e1a72fcca58-7f6694a964bmr3530338b3a.34.1765608522549;
        Fri, 12 Dec 2025 22:48:42 -0800 (PST)
Received: from [10.200.3.203] (p99250-ipoefx.ipoe.ocn.ne.jp. [153.246.134.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c4ab52aasm6927000b3a.38.2025.12.12.22.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 22:48:41 -0800 (PST)
Message-ID: <bf00eec5-e9fe-41df-b758-7601815b24a0@linaro.org>
Date: Sat, 13 Dec 2025 08:48:33 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/26] Introduce meminspect
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org,
 Trilok Soni <tsoni@quicinc.com>, Kaushal Kumar <kaushalk@qti.qualcomm.com>,
 Shiraz Hashim <shashim@qti.qualcomm.com>,
 Peter Griffin <peter.griffin@linaro.org>, stephen.s.brennan@oracle.com,
 Will McVicker <willmcvicker@google.com>,
 "stefan.schmidt@linaro.org" <stefan.schmidt@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/19/25 17:44, Eugen Hristev wrote:
> meminspect is a mechanism which allows the kernel to mark specific memory
> areas for memory dumping or specific inspection, statistics, usage.
> Once regions are marked, meminspect keeps an internal list with the regions
> in a dedicated table.

[...]


> I will present this version at Plumbers conference in Tokyo on December 13th:
> https://lpc.events/event/19/contributions/2080/
> I am eager to discuss it there face to face.

Summary of the discussions at LPC talk on Dec 13th:

One main idea on the static variables annotation was to do some linker
magic, to create a list of variables in the tree, that would be parsed
by some script, the addresses and sizes would be then stored into the
dedicated section at the script level, without having any C code change.
Pros: no C code change, Cons: it would be hidden/masked from the code,
easy to miss out, which might lead to people's variables being annotated
without them knowing

Another idea was to have variables directly stored in a dedicated
section which would be added to the table.
e.g. static int __attribute(section (...)) nr_irqs;
Pros: no more meminspect section Cons: have to keep all interesting
variables in a separate section, which might not be okay for everyone.

On dynamic memory, the memblock flag marking did not receive any obvious
NAKs.

On dynamic memory that is bigger in size than one page, as the table
entries are registered by virtual address, this would be non-contiguous
in physical memory. How is this solved?
-> At the moment it's left for the consumer drivers to handle this
situation. If the region is a VA and the size > PAGE_SIZE, then the
driver needs to handle the way it handles it. Maybe the driver that
parses the entry needs to convert it into multiple contiguous entries,
or just have virtual address is enough. The inspection table does not
enforce or limit the entries to contiguous entries only.

On the traverse/notifier system, the implementation did not receive any
obvious NAKs

General comments:

Trilok Soni from Qualcomm mentioned they will be using this into their
software deliveries in production.

Someone suggested to have some mechanism to block specific data from
being added to the inspection table as being sensitive non-inspectable
data.
[Eugen]: Still have to figure out how that could be done. Stuff is not
being added to the table by default.

Another comment was about what use case there is in mind, is this for
servers, or for confidential computing, because each different use case
might have different requirements, like ignoring some regions is an
option in one case, but bloating the table in another case might not be
fine.
[Eugen]: The meminspect scenario should cover all cases and not be too
specific. If it is generic enough and customizable enough to care for
everyone's needs then I consider it being a success. It should not
specialize in neither of these two different cases, but rather be
tailored by each use case to provide the mandatory requirements for that
case.

Another comment mentioned that this usecase does not apply to many
people due to firmware or specific hardware needed.
[Eugen]: one interesting proposed usecase is to have a pstore
driver/implementation that would traverse the inspection table at panic
handler time, then gather data from there to store in the pstore
(ramoops, mtdoops or whatever backend) and have it available to the
userspace after reboot. This would be a nice use case that does not
require firmware nor specific hardware, just pstore backend support.

Ending note was whether this implementation is going in a good direction
and what would be the way to having it moving upstream.

Thanks everyone who attended and came up with ideas and comments.
There are a few comments which I may have missed, so please feel free to
reply to this email to start a discussion thread on the topic you are
interested in.

Eugen
