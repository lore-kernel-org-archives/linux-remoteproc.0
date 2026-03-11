Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B063830F7EF
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 17:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773249667; cv=none; b=TY5KxKUfuKTGosaW1tgyw3mcKJTEPE4jVr2HHjTUX6rA9oMBIbNWo8DJkHPJPkUMBzz2slEH9QTHBEn3PibDbDU7TXaxtVhgbURCBbTByGZNp4pzXQdJ4YPdx5VZ7z/64G3wef2O97JmjUPDLC/XzmjEq2Bo478QwQV/v9Ntyuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773249667; c=relaxed/simple;
	bh=37ro0LdVssBpdr9YV7WFZmX7QJXkkG9R7lAPHfVPfVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJR6ybkFLXkG+zyaaYH/b8Bvg/lKmchIKJ48rz79R4kc6NhcbMmLzKYWiXBztZkFryx67s28gz2WBrmVmtwJQxPfPpvBGPrUFH/M/Bl+a2sJEOolMvYbV9KAGUej6warUwWYl9PicFuaXruaL4MafFdUGIe3I336gohA7kJaCoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ez3lv/wc; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ez3lv/wc"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2aaf43014d0so1340845ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 10:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773249664; x=1773854464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V7QuY2IvGCqSSBdyso8uzQGpjnvc5nll1p5/k4gdBJI=;
        b=Ez3lv/wct9vKwx8M1SpMyoNFGvsn93dsADnCs72oar8KCRqP2jMsuwhgkmu3CAwQth
         LQoHg4kLp7JelG4wNLGgB/r8jQaT5c0SDkjQo3ANNdMA/3LtWyduTegBtigKAMkdLeGm
         lTNYwheLwySHACpotT5GUoEfUiUUgvCSKc27s8sZEPQW1MJXaAlPQu1HpkkDKdG08BMF
         V+FaNM+M8+DHHwgzDvGhvns5D1vBnntNPc8SkAg1z0c8kc6eEqsxZO8cpWAU5MZGuHKN
         YFprhtRXbBQvCql7ehzcAeyRB7naWncoF0rmk+XV3R4KYbRTVBu22nHP2xuU5NZr+kKC
         0jNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773249664; x=1773854464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7QuY2IvGCqSSBdyso8uzQGpjnvc5nll1p5/k4gdBJI=;
        b=YfCAxH6RHBh9kMXhf3drVuK9ORdlcu44FkU8SOqhJGtj5ruJPpX/a80u9+b3oFgReY
         c6V3TaO5jOlvrogc12/hAAp9rANA8OL92GvPVdwISwHi92UwZ3qfOlKvxRC4A+YTC6ZB
         aRk0ZAaKTEJeRluo9aYeVPQwmLk+vjFxnA7Yks8fuFtD4TZULPD7OQYLJ4yd6/i5oXN/
         H8Wus1byaNtvak9IDqyuqQ9WOZ9bzVSkfbbsjAb5KiNG3B/juEwXgzgYdft2yWU7Lwq1
         5Et6jWJVLcCZiZ0G3CJEp3d8T49UkRH/U2PvtC4bp/Kd0w0P3Np+L3cB+PxX7Lke2bPt
         dACw==
X-Forwarded-Encrypted: i=1; AJvYcCWDa+saGNXRPqoQfQnG7J1WXMiV4WleahX9Rhf9ujgyE4GRlfDUyRDXMYnC9fDzR2NmkEz74U9hAvTUrrfnWkCI@vger.kernel.org
X-Gm-Message-State: AOJu0YwpOdPaDPFdcnRTBu5T1dZTVczERTgiV9BReZ82Wj4CFKYH7QXz
	wxB3+wzTDZs1tnhfnorJMe4AuFiWns+iNxc2No54C799Mly1McBhpBOPPzZvNiGjHnKpRxk+gLS
	zQKIi
X-Gm-Gg: ATEYQzyYq16/UNonpxrnC5aIr6YVExNObhrZV6R8wwTySSOP1bwVPoYrS4p/ibIdShf
	jDuLe5Rc2xanAM7fVmecimay3PWXHfGYoZ7agGbHyU5nJ2yKqrXwHd2crBp63wnXukkKA4gHYpo
	3vdFwnlTDLpaumgSEnGT1gXJeETfUA6WSfuRa/0D5fa4Aa8pf2tXnKJV+MEvp6Tlbmr0YLm63qR
	5LXWdQTOusiEBfBrv9RwlMBV2i64LuRLlrxur7MURSWQBuLmdbiv782jtl8Ot2QQgmOLgkaXU6o
	17bR82qtsQU2PIhDKDqn6+i/K8e0Ru6dWRswurWRUxd42373ASTWHTnUK50uYJhcGtZ+f4GD+xM
	VcznPP5/eAl4vWKiyUAU5/zgLx+1Xi8heVZy49Z5x7w+wyRD/7ld+PHtf5Hh8ano3bCM3FcuP2G
	YF6w/Ytn6SRZscM9LkpHBOL5llbPk=
X-Received: by 2002:a17:902:f70a:b0:2ab:230d:2da9 with SMTP id d9443c01a7336-2aeae8dce39mr34727925ad.48.1773249663876;
        Wed, 11 Mar 2026 10:21:03 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:80ec:cdb0:5d0e:6048])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae378ca7sm28243875ad.91.2026.03.11.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:21:03 -0700 (PDT)
Date: Wed, 11 Mar 2026 11:21:00 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] remoteproc: xlnx: remote crash recovery
Message-ID: <abGkfM9O7Qpd1N68@p14s>
References: <20260303233533.2310513-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303233533.2310513-1-tanmay.shah@amd.com>

On Tue, Mar 03, 2026 at 03:35:31PM -0800, Tanmay Shah wrote:
> Remote processor can crash or hang during normal execution. Linux
> remoteproc framework supports different mechanisms to recover the
> remote processor and re-establish the RPMsg communication in such case.
> 
> Crash reporting on AMD-Xilinx platform:
> 
> 1) Using debugfs node
> 
> User can report the crash to the core framework via debugfs node using
> following command:
> 
> echo 1 > /sys/kernel/debug/remoteproc/remoteproc0/crash
> 
> 2) Remoteproc notify to the host about crash state and crash reason
> via the resource table
> 
> This is a platform specific method where the remote firmware contains
> vendor specific resource to update the crash state and the crash
> reason. Then the remote notifies the crash to the host via mailbox
> notification. The host then will check this resource on every mbox
> notification and reports the crash to the core framework if needed.
> 
> Crash recovery mechanism on AMD-Xilnx platform:
> 
> There are two mechanisms available to recover the remote processor from
> the crash. 1) boot recovery, 2) attach on recovery
> 
> Remoteproc core framework will choose proper mechanism based on the
> rproc features set by the platform driver.
> 
> 1) Boot recovery
> 
> This is the default mechanism to recover the remote processor.
> In this method core framework will first stop the remote processor,
> load the firmware again and then starts the remote processor. On
> AMD-Xilinx platforms this method is supported. The default coredump
> method is supported.
> 
> 2) Attach on recovery
> 
> If RPROC_ATTACH_ON_RECOVERY feature is enabled by the platform driver,
> then the core framework will choose this method for recovery.
> 
> On versal and later platforms following is the sequence of events expected
> during remoteproc crash and attach on recovery:
> 
> a) Remoteproc attach/detach flow is working, and RPMsg comm is established
> b) Remote processor (RPU) crashed (crash not reported yet)
> c) Platform management controller is instructed to stop and reload elf
>    on inactive remote processor before reboot (platform specific method)
> d) Platform management controller reboots the remote processor
> e) Remote processor boots again, and detects previous crash (platform
>    specific mechanism to detect the crash)
> f) Remote processor Reports crash to the Linux (Host) and wait for
>    the recovery.
> g) Linux performs full detach and reattach to remote processor.
> h) Normal RPMsg communication is established.
> 
> It is required to destroy all RPMsg related resources and recreate them
> during recovery to establish successful RPMsg communication. To achieve
> this complete rproc_detach followed by rproc_boot calls are needed. That
> is what this patch-series is fixing along with adding rproc recovery
> methods for AMD-Xilinx platforms.
> 
> Change log:
> 
> Changes in 3: 
>   - both rproc_attach_recovery() and
>     rproc_boot_recovery() are called the same way.
>   - remove unrelated changes
>   - %s/kick/mailbox notification/
>   - %s/core framework/rproc core framework/
>   - fold simple function within zynqmp_r5_handle_rsc().
>   - remove spurious change
>   - reset crash state after reporting the crash
>   - document set and reset of ATTACH_ON_RECOVERY flag
>   - set recovery_disabled flag to false
>   - check condition rproc->crash_reason != NULL
>

For V3 Bjorn made several comments in relation with QCOM use cases.  As such I
will let him continue with this patchset.

Thanks,
Mathieu

> Changes in v2:
>   - use rproc_boot instead of rproc_attach
>   - move debug message early in the function
>   - clear attach recovery boot flag during detach and stop ops
> Tanmay Shah (2):
>   remoteproc: core: full attach detach during recovery
>   remoteproc: xlnx: add crash detection mechanism
> 
>  drivers/remoteproc/remoteproc_core.c    | 15 +++++-
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 71 ++++++++++++++++++++++++-
>  2 files changed, 84 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 098493c6dced7b02545e8bd0053ef4099a2b769e
> -- 
> 2.34.1
> 
