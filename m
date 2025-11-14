Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C04A243951
	for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127361; cv=none; b=XlNt9IhBlJ78nJq2pG0gk3oZUygwRi7nkbgz/feSGPIGwE0rrhMfkpo9/a6iN3IgNnnpzsP4G8OdnDL5XT93FbqsCkpX/ZtX+4WfERwJa7L6YRuH6ph4ageEE11M4oakKAgqi4l9sGjSIfuC66Fv5Sl+o9GJPKVNSK1v9BVv1u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127361; c=relaxed/simple;
	bh=qw95CvdMmCrTiI2QSJae3SJp8u12cU/mjgFB23QBOoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4XLHLLQUxyt6Xvc1aSvehsXQl13HdBNveUo+kUaijxhNs0PCgLQdgHtlLtkP308xzxerZhCWY6g0dgGGRFVUG+JCjm7qZr18lYjq4S6CYx/5sWo5foWWrITr0AoMVXpcqQoNWuZMfV4pWnKzzZYFxosWyJvb7S1EbzPMFzs7Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQ2p+2be; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQ2p+2be"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so1738316b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 05:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763127360; x=1763732160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=scABYrWfLMryk0p1vRaa9SSZUmq5nZBEo0AWWVBIqSc=;
        b=DQ2p+2be9AWQGD60U6Q17k9HcuEkVUYxHEDoAB4LADRrYiKP/C33MOCV09Jpfpt29Q
         TfjeIPJeTSbKWDN+3QMOTwLj/FIUTIlNu86IFN9CWzjXAEFoH5w4go8A5roOOza/GiPr
         64NZOFhVFKEjkkoJ6Z/RZiukpZS3dQfi2qzbbWfgpgIu+Qj//7x16c9+/aRQ6UsBjrPs
         FD+ubYsibSzbP5IFywqne5XnFxPmCaJuZWB0q+ACfbkLgMW3me/2PnwlPe2x6E+mOhfD
         bvmYlW1SF3WitdHVb/adqjbTMJg6+yNKCmQx+flFFKulaDH8bnFOT/SsuHbYbABlV7cy
         zKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127360; x=1763732160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scABYrWfLMryk0p1vRaa9SSZUmq5nZBEo0AWWVBIqSc=;
        b=DcL3m/5hFrnAi0IU9rXjILZZhAHzZuW79fzRJSdLefsmzlvkksfws5JmedszhqmMHz
         IoIb6M64louXeocXoZyplheQ627in5oSYZenvQEpiZ1hxBETM2zP0MQ00eJRnVLscfng
         9s2lzZAigCh0EhZ1Jyx8+5pWiJ0Vna3I5DN3KDTPKOjX112HtjP3iMlqjP1VX7Qim4Hf
         /Xe3XrsGTJlkkm3OuY8uLHbK3uxe1qF6/BfoDKfnWLV72s4Jqod+tnKM4DiM+g43t3mN
         z1VQlIF5EY++slnzVaHRWuOOI1o+H4d32dnnt1ix1uJRCGl/nc86ssDkYnzY3F3KA+RJ
         CbCw==
X-Forwarded-Encrypted: i=1; AJvYcCWHUxTRANL3QutushYb5ztoht6owRHr5rKjBhfuOgfDMONO8qoG5VR0Cn3zFA+m5/Y9kCNSqRknTDe3KfV4ZczT@vger.kernel.org
X-Gm-Message-State: AOJu0YxENDXTPshz6p0d3w7TcmKHDEYsQCLEIKpROEsINeVHWYxzkHZy
	ML6ao40cFY08z+pm4EGMyETSu9SpWJrJQvoeaB9VWo8jc2aRVLy/xoCM
X-Gm-Gg: ASbGncvuyRUf3D6bYktAV9aRLGIg9jQZ7rcwRSPVJAs37CgZbTcnHzpBZXR0cjXvbLY
	psDC4h0djSd93HXf6g5El201o+r7EBTKMuCqJ2bIqCrfD5accRLbF1ppZej4eyF+zqw3fFzSjot
	mhVRAITepyepLwQNSCLGQddsG2dy3//SFn1yFQH+svLaUTvjEsVTkbBpJOZJTOfbkFSSceHyX5T
	8IkwKPEMFcSE8d2duEASU8eDpVxARF5IWepgxS2i7XS0rhl8PvZZBs4E0rUrNxykXJfbcEUwnem
	C8Jo7jMUYt2awArsCPv9ePAuQ62ksWEYA3I3zEXEznWAlhnQXLipVEDqjAFlHxfxNyLYAh34RDD
	P6m4sS74H3HN5S3nsfZNr7o6xC393eTMXj2iNNG1o/9OGi9HpPRlmSwzcH9hRqNB/V38wbon2nY
	HvCdEgBMHCnR8A6onHRg==
X-Google-Smtp-Source: AGHT+IHwhy1vTerg5Gbcyy0Rh5fn/eKlAsIHslT76ScI3eW0anR3tnZ2sM336zTG90LT4R0w1+j48g==
X-Received: by 2002:a05:6a00:2408:b0:781:4f0b:9c58 with SMTP id d2e1a72fcca58-7ba3c080cf8mr3820686b3a.15.1763127359646;
        Fri, 14 Nov 2025 05:35:59 -0800 (PST)
Received: from [192.168.1.50] ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cda04sm5245361b3a.19.2025.11.14.05.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 05:35:58 -0800 (PST)
Message-ID: <99c99fda-a3ab-4575-89fa-8d2e6a3ba4ab@gmail.com>
Date: Fri, 14 Nov 2025 20:35:52 +0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation: Fix filenames for remoteproc/rpmsg
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, corbet@lwn.net,
 andersson@kernel.org, mathieu.poirier@linaro.org, dan.j.williams@intel.com,
 cedric.xing@intel.com, pasha.tatashin@soleen.com, kevin.tian@intel.com,
 skhawaja@google.com, yesanishhere@gmail.com, taimoorzaeem@gmail.com,
 linux@treblig.org, arnaud.pouliquen@foss.st.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 rdunlap@infradead.org, imx@lists.linux.dev
References: <20251114065746.901649-1-daniel.baluta@nxp.com>
 <20251114065746.901649-3-daniel.baluta@nxp.com> <aRcEoX9saonpQuvf@archie.me>
 <CAEnQRZC7n127nMaCo+UFnfvKHsRZJTMrmNq4FadfzDJa=1UUnA@mail.gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CAEnQRZC7n127nMaCo+UFnfvKHsRZJTMrmNq4FadfzDJa=1UUnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/14/25 18:33, Daniel Baluta wrote:
> On Fri, Nov 14, 2025 at 12:29 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>>
>> On Fri, Nov 14, 2025 at 08:57:45AM +0200, Daniel Baluta wrote:
>>>     This document describes the rpmsg bus and how to write rpmsg drivers.
>>> -  To learn how to add rpmsg support for new platforms, check out remoteproc.txt
>>> -  (also a resident of Documentation/).
>>> +  To learn how to add rpmsg support for new platforms, check out remoteproc.rst
>>> +  (also a resident of Documentation/driver-api).
>>
>> I think "also a resident of ..." can be dropped, since it's redundant (it's
>> already covered in remoteproc.rst cross-reference which transforms into
>> the link when you build the docs).
> 
> My point here is just to move the patches to a better location without
> any crucial modification.
> I can send a follow up patch if this is fine with everyone.

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara
