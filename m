Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AD33009C7
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 18:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763576673; cv=none; b=BYQ8hWBThFai+EEJk9M/soMxh9aGI1HaY0xOIfwLvaPMhyy0d8lnW9cbUmwCELGyyjtyu+ynfTZwiT/5kQj9hqK1LWVgGd30IALDXFZIWtA4e1UkFX7eGZzfKf/e6MruRiipKRc7Rsr2Oyy8dpZgK2cSG8TqTzHzGBprp+vI7J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763576673; c=relaxed/simple;
	bh=d2VKNeBI9mdU3CulQqLDBXeD89R8ghbqwp0xbHbIKDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1w2WGMmaiPsXhm+QEQDwr8LHFAVgi6htYAqSpPWOnGVOs3bJQFYNf80zXmitPNUeVSE2hs0n2x9xBgpkgLToXRXmoXYR2M3G6jU3Xtt6iCkkLFrBNMK+cHZCVo49dcqwQLAskDS+b0HK4ia/m6NZKRkhr0UHLiduXPX94blCQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NHB56gLK; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NHB56gLK"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640d0ec9651so2469705a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 10:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763576666; x=1764181466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXp2uUfyAn7qQSV84bcf4nMWFAwyWFqJON+TttJbAcU=;
        b=NHB56gLKbXdEvERiIKxyKRzQy9x+BRJO0FalV2vWqUvsDwCie6WhACfrN9e36qHhJG
         OGpSc25nBLdINljnrtbcWaXr3kHm5dxGf0IyXFcfK4WZma60ovr/3E0doiG8m5vj643e
         mriYNHJ2bsjrcqiN2uO/CUNNlORYDELZ3r1mrN1g7c6GkCoiTvSnWQKAj3EjRL5lIGCG
         oRlG5Q/VRcCNsBAAfLsApgXoxbL9PG3ka/MMCPIVWRWXSJjbGggV6lyCKu/VgSv0dZKK
         25bBFCR+Uj3S5mAGC6qgXTaRuKtSvSx5Hs/MYXahRdJSseagBo7onsRf697vqSx8U4+u
         eBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576666; x=1764181466;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXp2uUfyAn7qQSV84bcf4nMWFAwyWFqJON+TttJbAcU=;
        b=WtnCTv1JP22smjo4L199zMhnXCgLsWpkBcRx35tsHPFsr9NEQRAr5UweihtXXQqlx3
         I3geEPNyhoeAJNw0WirbACCLUccOBO+MlJVQdkL2U7bm9WNkFFiBBKEW+eHyjmG6vqyp
         ljyG2yeFWkjJQ/vXs/dJvEpZzS02tlgxpGJP7B6PF1nFCktke6lV2LRhiDd96dhUjgT0
         Hfad2dNEJgHAuoArXw7OqJAOKV4O/0c136i40oYYwtrLrIJ386h0U5Iwu4cFbI3XZCac
         bJHrNlijSrsBUv5Jy8BdZwAtL3ojZf0BxVPMHVb+32Q5dwqoonMpLTIBr1g5QoUl6g7S
         WXkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKixQiQ+aQZt1VYrChgNWBh+8jYiQw7eOprW4fCxnCPS58MMYwarlAGEXYYi+ut4uKdXjEHvVz0KBzekj1DLhy@vger.kernel.org
X-Gm-Message-State: AOJu0YysqbiyEf0D77r+z8seC0GkjtwPpvo8sm5BKgCHfV1Y4gHzNWaw
	V3tpP50GsXjqTEMPa/bIHWkGoS/MQCaXY34pZ0dh4iSJxKLUuvvY6jGfTx4m8b2EvoQ=
X-Gm-Gg: ASbGncsO9T3bi75W+fpAH4afWno8vHfVqmMabEnEx4oV/v7R4kfi0TV5deyDtemCzUh
	LvJ3wdH5rN6nkRA6ALaemi5DR5JlONgwIqWqKhA5AALrCYjaeB8Fjmcd/4s5b6qhQ9GRIOl764/
	DEZiffUzJ+i73Y1ivrqNmA+k5BsQlZPGk4vlXKEEf00sM08xfSB3pQXJkjFdoupzVbPxwOZGI3Z
	b8dx1AhDo8KVQjV0eyO137cPgt9PWfOfuXl9TqDwQphMg6ZupaUo2gtkZwn7ixlkQzPQsVclmBy
	ExFNwC+VQqe5ZbSXvEKe+BCFhA6ZQN4bV6CwcsO6BP9UW3mrceqqc9z1mPmYT+vOi8chGP5agqN
	4cC4BqgLSYuMmcg/Ib9+oNMEy+xvvFE9+GizmAJN/nc07yKxj232IofyYAgpo1KSrFRAbzcjwhA
	2FxUxlGJ06DTNMhWsBmlIsJFmHEt5+xHg=
X-Google-Smtp-Source: AGHT+IHFWcpqhe+aEp30Ksls0LghzQFo1sGYaD1WHh6eJAE08Lx/+/aqM6jp4/gMRRi4U1LtQQLFuQ==
X-Received: by 2002:a05:6402:5247:b0:643:129f:9d8e with SMTP id 4fb4d7f45d1cf-645363e41d7mr312140a12.8.1763576665944;
        Wed, 19 Nov 2025 10:24:25 -0800 (PST)
Received: from [10.101.2.140] ([93.122.165.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363b66e5sm169342a12.14.2025.11.19.10.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 10:24:25 -0800 (PST)
Message-ID: <b0102b82-9ae8-4e01-ba27-44b78b710fca@linaro.org>
Date: Wed, 19 Nov 2025 20:24:23 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/26] Introduce meminspect
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com, tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-arch@vger.kernel.org,
 tony.luck@intel.com, kees@kernel.org
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119131534.392277e3@gandalf.local.home>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20251119131534.392277e3@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Steven,

On 11/19/25 20:15, Steven Rostedt wrote:
> On Wed, 19 Nov 2025 17:44:01 +0200
> Eugen Hristev <eugen.hristev@linaro.org> wrote:
> 
>> Once you have all the files simply use `cat` to put them all together,
>> in the order of the indexes.
>> For my kernel config and setup, here is my cat command : (you can use a script
>> or something, I haven't done that so far):
> 
> Interesting.  Hmm, it seems this could be used with the persistent ring
> buffer code as well. But if the firmware does not keep the memory around on
> reboot (where the buffer would be reloaded), you could mark the persistent
> ring buffer's memory to be inspected.

I was kinda hoping I could get a chance to talk to you about this.

I managed to mark the trace buffer for inspection. By using the cmd line
argument to have it preallocated, it was very easy to just mark it for
inspection and dump it on a crash, as a dedicated meminspect region.

> 
> The persistent ring buffer creates a single allocation to hold all per-cpu
> memory in a single region. That is, because on a crash and reboot, it
> expects that memory to be at the same location and does a verification
> check to see if it contains a valid buffer. If it does, it will recreate it
> for view in the instance directory of choice.
> 
> Now if this same range is marked for inspection, you could then download
> the entire contents of the persistent ring buffer after a crash. It would
> be trivial to update trace-cmd's restore functionality to rebuild a
> trace.dat file from it. It would require saving the event formats of the
> running kernel before the crash, but that's not hard to do.

The problem is that all the meta-data is not allocated inside the
preallocated buffer. The meta-data is kmalloced all around the code. I
mean the structs that hold the information on what's in the buffer. You
know what I mean.
And all these kmalloced things, turn out to be in order of hundreds just
on a kernel boot, which I tested. This is not feasible for the
meminspect table, as it would get overcrowded very easily.
I thought of perhaps trying to kmalloc all of them in a dedicated cache,
but I haven't progressed on that. Another idea would be to try to
recreate the meta, but I have not found a way to do it yet.>
> That is, by using the persistent ring buffer code with the meminspect, if
> the firmware doesn't save the memory across reboots but allows you to dump
> it to disk, you can enable tracing within the persistent ring buffer, on
> crash, extract the buffer, and then use trace-cmd to rebuild a trace.dat
> file that you can now inspect, and see the trace that lead up to the crash.
I used 'crash' tool with trace plugin and I am able to see all the trace
contents, but, with the limitation above. (To achieve this, I dumped a
huge area to include it, so , not feasible for my goal )

> 
> Now I don't have any hardware that uses this feature (not that I know of),
> but if others find this useful, I would most definitely help them implement
> it.

We could have some drivers pass the inspection table and then store it
in ramoops e.g., tapping into pstore. This idea has been going around,
but I have not had the chance to write a pstore thing yet.

So , I was stuck, and I was hoping to talk to you, either by email or
maybe at Plumbers in Tokyo where I have a talk about meminspect.

Thanks for looking into it,
Eugen

> 
> -- Steve

