Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C212454BEA
	for <linux-remoteproc@vger.kernel.org>; Thu, 28 Mar 2024 08:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711613845; cv=none; b=nBUQ5MSL2VBkpPc+SYZF6Vxqzd374e6eWo8PiL+7uY2mYhlGr5N6gaUpXmDJ7Hr5jy/418P8uLfjUlEx9ktYM3SjFV/6ohT3aaCsh4swd7QY6nMt8ZBY7NbGLGJb0uxXWbX8rM6VDygxNhmvcZJvkxEN2wiyD0g91oFBWyqkU18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711613845; c=relaxed/simple;
	bh=viUPBi5u/rePxM8GR8iFMvfbunttp7pCB9oVVl+6VZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RNu7VwBPX3alkhReYYMePAhfZoG1IuFDNhPhM/FNPclMzJJSeOHIVp6yoMuSgpLQVa+IUTMqJKmdztnENWb3Brv8QBcirqpEHp7qBBE3u8Mirxd7a4CaYNxW1y7Q2rvQ2+qtRNB/cM/YnLG41xmZDIHYDjFvYgl4euAiRYHToM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OoVulfio; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoVulfio"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56bf6591865so1006855a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Mar 2024 01:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711613836; x=1712218636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HmNTrCP1VHaj+fSm0FhgBSVWxPEIQR4/guaH7m0B49c=;
        b=OoVulfiob2355XCm3a9pHJ/RvgLMUj8boYi/gf3+IjhiGsks/uluV5KHU5eTEMHbOS
         wAuGOhOqp0HDxBRDsXEc0k3GTd+XL0L9FmF6WLltCE1BnxJ+IZQvI8WLaOrfckJu9xsS
         c6n86a4gXuC/sc5uVaeJ24h9p6OH8SBe+Um/XSxc4t1PSrPuHX0ii1jeTP6/598Exat8
         /YOPJaj5PCyVjJmXoQE+L1oO5KkbWzy2tO4ozw/Svpv3sFfucMbcSCHJHTPY7RrN4dVt
         cgVo/umsZjVR+CCv2Rrq+whhAqEcq9Y428TyCCPvITNYuKlypGBGx4c8/PTaUgHZoA9M
         TO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711613836; x=1712218636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HmNTrCP1VHaj+fSm0FhgBSVWxPEIQR4/guaH7m0B49c=;
        b=UD6X3h4mFMEXmsFw/1UrCChxVgXmJIFxAoVy2TAY9MOedxh0FMP8Gf0hYjkhS74jg6
         NpFbi71HJh55R0QccrRpD9UjLgqPekzf1u0gpVBh/1j2atGrOTXfHzoFIccRtzZslPh6
         swBuHOomXA0CyV5rZMA6j9qLnKUoDDtBoppG4IfMmKCr6S/XhAxOvXyKO9WT2p7LMGbW
         E4g9CpCuqHK/QormRaYYq//jfIczkAJ0KROrf2Lj5ifkec3bUnSc8d0GO0e4ErXZSH7i
         5jxilMxhlEkg3TLqTJtTKO70/cozoEq5nTNCxu1EbkVbMS0Q8RwwvizypKYM5z0jtuXN
         mbhA==
X-Forwarded-Encrypted: i=1; AJvYcCVB433SBEwpI4pJf2tUo8nlyK6ZaE7R2AxmNEp9+p1OZkb9k+VHxVRfUyTfvVJ6V2H6Q8Ko6rsKcZbqs633HkuO2TO5MB/+mSr2Qutr9RRhaQ==
X-Gm-Message-State: AOJu0YxoVWTBlaL/5IuUGDoAS4XsCwKo3CLmWf/rTNSjVOsLJX51maSH
	k/LWz451gBUurSfmQ7xR5xWB3VzuRJuJqiUVr7oSVxvudsAL8Hx2
X-Google-Smtp-Source: AGHT+IGDZQiP+bPqJ26M2oncThf2wSh1zk+FcIY3MKrfyPkiPReC5vjXQTAeUmiXoDGxxm5y2+DQeg==
X-Received: by 2002:a50:ba82:0:b0:56b:8d0e:1a08 with SMTP id x2-20020a50ba82000000b0056b8d0e1a08mr1503758ede.26.1711613836260;
        Thu, 28 Mar 2024 01:17:16 -0700 (PDT)
Received: from ?IPV6:2a04:241e:501:580:a2ad:1d18:206e:34fc? ([2a04:241e:501:580:a2ad:1d18:206e:34fc])
        by smtp.gmail.com with ESMTPSA id di19-20020a056402319300b0056a2b87787dsm554087edb.37.2024.03.28.01.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 01:17:15 -0700 (PDT)
Message-ID: <07183fd8-a5a1-4cae-b317-d703ef7c1de1@gmail.com>
Date: Thu, 28 Mar 2024 10:17:13 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: zynqmp: Add coredump support
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Tanmay Shah <tanmay.shah@amd.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-remoteproc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <d4556268-8274-4089-949f-3b97d67793c7@gmail.com>
 <ZfhxUJjrcYfqt9Nd@p14s>
Content-Language: en-US
From: Leonard Crestez <cdleonard@gmail.com>
In-Reply-To: <ZfhxUJjrcYfqt9Nd@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/18/24 18:52, Mathieu Poirier wrote:
> Hi Leonard,
> 
> I have queued patches for this driver that will break this patch.  Please
> re-submit when v6.9-rc1 is out and rproc-next has been updated, which should be
> around the middle of next week.

Hello,

It's been a while - v6.9-rc1 is out and rproc-next has been rebased on top of
it. But the coredump patch still applies? I expected some unrelated
xlnx_r5_remoteproc patches to cause conflicts but there's nothing there.

It seems to me that the patch can be applied as-is and no resend is required.
Am I missing something?

--
Regards,
Leonard

> On Sat, Mar 16, 2024 at 08:16:42PM +0200, Leonard Crestez wrote:
>> Supporting remoteproc coredump requires the platform-specific driver to
>> register coredump segments to be dumped. Do this by calling
>> rproc_coredump_add_segment for every carveout.
>>
>> Also call rproc_coredump_set_elf_info when then rproc is created. If the
>> ELFCLASS parameter is not provided then coredump fails with an error.
>> Other drivers seem to pass EM_NONE for the machine argument but for me
>> this shows a warning in gdb. Pass EM_ARM because this is an ARM R5.
>>
>> Signed-off-by: Leonard Crestez <cdleonard@gmail.com>
>> ---
>>
>> Tests were done by triggering an deliberate crash using remoteproc
>> debugfs: echo 2 > /sys/kernel/debug/remoteproc/remoteproc0/crash
>>
>> This was tested using RPU apps which use RAM for everything so TCM dump
>> was not verified. The freertos-gdb script package showed credible data:
>>
>> https://github.com/espressif/freertos-gdb
>>
>> The R5 cache is not flushed so RAM might be out of date which is
>> actually very bad because information most relevant to determining the
>> cause of a crash is lost. Possible workaround would be to flush caches
>> in some sort of R5 crash handler? I don't think Linux can do anything
>> about this limitation.
>>
>> The generated coredump doesn't contain registers, this seems to be a
>> limitation shared with other rproc coredumps. It's not clear how the apu
>> could access rpu registers on zynqmp, my only idea would be to use the
>> coresight dap but that sounds difficult.
