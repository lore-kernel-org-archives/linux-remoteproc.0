Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46DF1DE4DB
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jan 2025 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736182569; cv=none; b=YbFt0n0VqSOaCq5dpwSzO9yc0PPww6/yK0PpU0DsS2VlYBs5KDQ+Z9SJPkvr1lx29mgs+3MmU8jMY72j6EKlKw3Z7w0L5jnrMPUvArhpk/MLTAGQinQAnunsxDkP7FWsT3UZ0a0I6ivJ7BzSgG2oASTQ6ajOPB8uDdFkt4ur3Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736182569; c=relaxed/simple;
	bh=VEIyuQQYk0DTnq+G5GpCzYdCYj/iN14eBTLLzbexIfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qB9wYp7RGTSV6rbTg8tYLH/rEMVHqLmx2vputzA+mO1Mv/1Q9UvNGvDNJWnxvniyQynsqEEoAJVScbewiUd6+k0puHAVLq8deipYzKSAfqAk0RYFsDFEgsPUlyVSTyhtoMdJPW55PRbJtSRRiRFQ/rSfTBdkEk3XqIJ6R7wndEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rYkk71T3; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rYkk71T3"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f42992f608so16913107a91.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jan 2025 08:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736182567; x=1736787367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KMsHepO8ZvN5niVdUS/0Yy0aUBnPp80SWoLTHbVLdY0=;
        b=rYkk71T3iZs3Vzs7JydxS3HH6SYk3hrfnbrNlXTOWEL9gffPzWtswJh1B94SfY7/zB
         +SySx5mHean2S+KVrWnCrRAtpt9WH57uc9ARRMa7du65V7VUQ82FVKunJl0hhBARa+N9
         50unPvQuaw9uOVRbrDvltdFqWn7DoMuVqcqJmZXJnWm/TqnCuyXX0UzHE57nZTz2JmUF
         OiU9JbiDTgHZufhCUPCIFqaR1BpTKkxrc55d7tB308UFojaSz9mX+7Qyi252ZEGhsYg2
         LKyp6JmC2Hi9WmVu32kHyFjiWSjoWJnBqtl5t7fsn8HQwimzFnrjQwx3rqjeQMV56sR1
         Kb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736182567; x=1736787367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMsHepO8ZvN5niVdUS/0Yy0aUBnPp80SWoLTHbVLdY0=;
        b=qaLDdKZs3mj3fvzVjcifsrNvuoLW1ULr4HMTLLbbnjFR6+PSe/wW8w7L7P/dRN9RX9
         58rKgtUpbSo3Viqgv9kc8yjK5VNr1aYe4UL8iVUQ0gdF3LiDcw7vmQaRY6umLNHoPgg2
         qlKBdG43yE0q/YWlalXVkw5dOV3tIOSXud0ovABPShB5KgYJQpLNbhAkT/VZ71MA3gFm
         TCJj9U7a3gAE4lesAWbKLEGBCaEnuINkFUv3MUqqvkF9vhXdAvDrgKWNomDkqOFbCSD4
         lyxkWvOETkBik0uEFSoruFSQpfwMAzL70UrKFNqRAZVKVwzVJ+/6OtLxiS1YY0wpxn4z
         zIGA==
X-Forwarded-Encrypted: i=1; AJvYcCWpuRR29wS/1ezwpyLMa99SFz8j1KA9j0VFIg5vzL+ftTKjK+5f3/DMjeiTkzNSuZlVT2QQiNWlpDVfW5E8SvDl@vger.kernel.org
X-Gm-Message-State: AOJu0YxQZiFxUTLpzg7UKjU0FN/EYZ9M9MNsMt+IsiK81xp5CnLsNAto
	pi4s+JGPmzuZRNb7UGmjMaR+JBVV3/O3UjhU/oH2oe30RvH78ad0cn4sasVy/+k=
X-Gm-Gg: ASbGncuICsjfoo/WeIRtFLkSSjMPx3ZHEd3Jt3Ld1xq1QkLhgd7gSaa52h6/WJjsZ4/
	s1tTtF8rQyZ/slMnVyND5sfg5FOyv6qb8+EKuVfTG3nkmgno42hkUwOuJYLGRIq8ee18ZQKTpz2
	zRadLYZp5mDe4xXblUdJPeOBFauvtcKx53y7oVVA/tpp8W14Mie4pvDE0lxD6FYT1Bp2IIjkY6d
	PE7acSwoZYy2qLCs929BNPTJ//ublnqOl0Vur+aURPvgsf8feUV7raEDHKY
X-Google-Smtp-Source: AGHT+IHXuIuhH4k8CgCmwf3Va0ZyrJ7eaYRruTnMkffQlqEgmEjKebr27R3FBZEKFb/zkqd6aeDklA==
X-Received: by 2002:a17:90b:4ed0:b0:2ea:37b4:5373 with SMTP id 98e67ed59e1d1-2f452e22604mr90317235a91.10.1736182567169;
        Mon, 06 Jan 2025 08:56:07 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:8b9d:9aad:a333:f49c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed641ed7sm35922965a91.23.2025.01.06.08.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 08:56:06 -0800 (PST)
Date: Mon, 6 Jan 2025 09:56:03 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, afd@ti.com, hnagalla@ti.com, u-kumar1@ti.com,
	jan.kiszka@siemens.com, christophe.jaillet@wanadoo.fr,
	jkangas@redhat.com, eballetbo@redhat.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Use Device Lifecycle managed functions in TI R5
 Remoteproc driver
Message-ID: <Z3wLI26Q400k9Ls9@p14s>
References: <20241219110545.1898883-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219110545.1898883-1-b-padhi@ti.com>

On Thu, Dec 19, 2024 at 04:35:40PM +0530, Beleswar Padhi wrote:
> This series uses various devm_ helpers to simplify device removal path in
> ti_k3_r5_remoteproc driver. This is the first series in the TI K3
> Remoteproc refactoring as long planned since [0].
> 
> Testing Done:
> 1. Tested boot of R5F remoteprocs in MCU and MAIN voltage domain in both
> IPC-Only mode and Kernel remoteproc mode in all Jacinto K3 devices.
> 2. Tested Lockstep, Split and Single-CPU Mode configuration (wherever
> applicable) of R5F remoteprocs in all Jacinto K3 devices.
> 3. Tested shutdown of R5F remoteprocs from Linux userspace and also by
> executing `modprobe -r ti_k3_r5_remoteproc`.
> 4. Tested that each patch in this series generates no new warnings/errors.
> 
> v2: Changelog:
> 1. Re-ordered patches in the series to use devm functions starting from
> the last called function in remove(), to ease review. [Andrew]
> 2. Fixed a missing return after dev_err_probe() call in [PATCH v2 3/5]
> ("remoteproc: k3-r5: Use devm_ioremap_wc() helper"). [Andrew]
> 3. Removed redundant rproc_del() call in [PATCH v2 4/5] ("remoteproc:
> k3-r5: Use devm_rproc_add() helper").
> 
> Link to v1:
> https://lore.kernel.org/all/20241204111130.2218497-1-b-padhi@ti.com/
> 
> [0]: https://lore.kernel.org/all/Zr4w8Vj0mVo5sBsJ@p14s/
> 
> Beleswar Padhi (5):
>   remoteproc: k3-r5: Add devm action to release reserved memory
>   remoteproc: k3-r5: Use devm_kcalloc() helper
>   remoteproc: k3-r5: Use devm_ioremap_wc() helper
>   remoteproc: k3-r5: Use devm_rproc_add() helper
>   remoteproc: k3-r5: Add devm action to release tsp
> 
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 88 ++++++++++--------------
>  1 file changed, 35 insertions(+), 53 deletions(-

I have applied this set.

Thanks,
Mathieu

> 
> -- 
> 2.34.1
> 
