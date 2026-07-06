Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD4B3BADA2
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 17:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360284; cv=none; b=imIVGGI45gyFw+CNKNCrh2p1AWLw5Teb+r0S1jhRfTNfgvnvpLZHnsovrEO0Z5jVthKk9Mw8dzgSzBRzfqGA6yDRR528nv73gUT+yqdwYxGvInJInSYwl2v/pjf+FRaK7CKoIOObbJAot5Go5MjJZYGrpRgeYQW1+A0XNiIFKCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360284; c=relaxed/simple;
	bh=iqPcaDX8+ofWqR45cCOR80BwZ+rJfwSYzP09KL58uqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhCjOapskiUFednjm6quXwdvYUSCRCH9WDGFXMDx1lWqOxMo2Hl8Y4xzLec2UaE4TQ8/op36DA0ur/w6qpHg3qJlCWochSPY1DLzs1j4al7vWNOWwidnrk+vGQgvndPy/CvD1JzvhDmiqiQ7AwsgMhZ7Y/jm6EOx58XdvodEr9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BB3DSDpR; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BB3DSDpR"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-847968ca62fso3449334b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 10:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783360282; x=1783965082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JUdPL7CBc2jTzzkN0FRzKQhA0cAKgFDmjflcqs1yy64=;
        b=BB3DSDpRGUlzBLzytFOVrlIsRZT07t9XM5304Jie7GkRmTD1x3Kd8nYuY8BNYawLHr
         FLdABza6VetEo98hyo452JIVSo9dRHu9okwfUAlejI6Cz2jk6ueUczMtdkemTI2ZxjwM
         yosl7cfOlUerVBf5JUjf3/rFlDMQ8eAGzhlYClIO7780iwDa6Sx7cN156a9ETRwu7LJG
         of/jQ1wvh/R9RdOBqIPyk2n5dXZ8A2vmN6yPmeJ4bN8dScWhB2Cw2fGJCP8JZVuxrMO0
         +Y+RdYVNfWMahP4G2eVn8bAmqOcrHz2HDHIqBfZT4+Q+Ng451l9435cnJgqN4QO3I1hK
         q7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360282; x=1783965082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUdPL7CBc2jTzzkN0FRzKQhA0cAKgFDmjflcqs1yy64=;
        b=fdf3QoklHJywbGQyLHejPSeJGbQPdL0+PhsuYglVRqKYcomKuqsKy5FK5uXhVn2RYz
         L0rA94vFR6E3yZkp5dE0LAzqtZW9dxuD/ruFVWyFXxeXyL2xNDXdgV0RWsSWjTUjn3S6
         SOupPuMcoqAk90wFZuRODUeoIBA/PwmhhGXlgNTiFmzyA0Zuch/QCGYfPtP2P20bhsqF
         2IHW9a4o625k9BxSyIJWWgLe+cULE9e7nIonX9y309lp1Fm5mxiH2HFe8yPpEAroT3BS
         OzqnLhRfB22niEot62iN53zuIHXmtnABdPmoP1yL1hisYJCHNda17/KcJLQGhplV5au+
         s80Q==
X-Forwarded-Encrypted: i=1; AHgh+RoKKQ334XkAVJYCKLVilI3i/XpPSfKJKlCQ/9+MM3O5M5I4ffZxyBjwyh4dE0xlmXrpAhieMjvl2IoHw5JakJgX@vger.kernel.org
X-Gm-Message-State: AOJu0YxE3WLotGdy0cg/Js66cUPryQoLSeI/qvFAEIj02ArscsEzh8Pj
	mdkO0LNfszr1ZtX3ffq44CkLtioJdfd4lZuTTIw+sHsK8JB7IGuxagu5HWtjLP06BGBQ30NlNVU
	FOnoZEv8=
X-Gm-Gg: AfdE7cks34G/jrnWFtF5om0aIo06KwO9UfPG+Bx/wyUOxE/FXz+148fHCpFriPvVplh
	EOnCP5k7IoMyRWzTUoiFE9ZACHaUbB3I4lgNcgy9phipMzi7amr2McMvC+iED/OZ/DfUxYkyR9I
	dmhf+yBbbTybsgcx9WJfPlc64kgalFe9JOHxN2RpCUEGr3Tn+veuNZrSEyug96rBU2zAhVfMByb
	8Tbfhrc98yWhxdUV1Wr1WAwU/o39RXJMrJDhe2x2LUwpARsjflx8Mg2rjp3ZLHSCT0dZsAnWb9D
	rKBgI6mGaDeGlCBdTd2r2Z+ceOx0fIIeETLGgM3bBNyiGaBUddDvX9g0HozqDHAuSG27bnUHpu7
	C3wHF+tMOjSoXHEu6d7QEnxm/OIOIr2K6Lgon14G2LNKNBShjAZyqUmLxzrbNZK6j0fq1nu6nK9
	fSayTezzPa5I830g==
X-Received: by 2002:a05:6a00:4c1c:b0:847:8d2d:712f with SMTP id d2e1a72fcca58-84826b80fd2mr1589704b3a.10.1783360281535;
        Mon, 06 Jul 2026 10:51:21 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c7ae:56e:dc6:9a54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b60571sm4208461b3a.9.2026.07.06.10.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:21 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:51:18 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] remoteproc: xlnx: remote crash recovery
Message-ID: <akvrFuJhZ2tWm79x@p14s>
References: <20260630004806.3835488-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630004806.3835488-1-tanmay.shah@amd.com>

On Mon, Jun 29, 2026 at 05:48:04PM -0700, Tanmay Shah wrote:
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
> Changes in v6:
>   - %s/XLNX_RPROC_FW_CRASH_REASON/XLNX_RPROC_FW_CRASH_REPORT/
>   - fix if else condition to reduce indent level
>   - %s/crash_state/crashed
>   - move setting rproc feature during probe
>   - remove redundant clearing of the features during detach() op
>

Applied.

Thanks,
Mathieu
 
> Changes in v5:
>   - cache crash report to a local variable then act on it.
>   - End crash report string with '\0' without relying on fw
> 
> Changes in v4:
>   - Optimize crash resource memory by changing type to u32 to u8
>   - Introduce version field in the crash resource
>   - Check crash related condition before rproc state related condition
>   - Move crash reporting to the bottom half of the isr instead of
>     actual irq handler
>   - Introduce 16 bytes array in the crash report to store crash reason
>     in the string format
>   - Remove redundant type cast
> 
> Changes in v3:
>   - %s/kick/mailbox notification/
>   - %s/core framework/rproc core framework/
>   - fold simple function within zynqmp_r5_handle_rsc().
>   - remove spurious change
>   - reset crash state after reporting the crash
>   - document set and reset of ATTACH_ON_RECOVERY flag
>   - set recovery_disabled flag to false
>   - check condition rproc->crash_reason != NULL
> 
> 
> Changes in v5:
>   - use local variable to access crash report pointer
>   - End crash report string with '\0' without relying on fw
> 
> Changes in v4:
>   - move pieces needed from rproc_detach() to rproc_attach_recovery() to
>     cleanup the resources
>   - use rproc_attach() over __rproc_attach() to create resources again
>   - keep rproc_trigger_recovery() unmodified
>   - Optimize crash resource memory by changing type to u32 to u8
>   - Introduce version field in the crash resource
>   - Check crash related condition before rproc state related condition
>   - Move crash reporting to the bottom half of the isr instead of
>     actual irq handler
>   - Introduce 16 bytes array in the crash report to store crash reason
>     in the string format
>   - Remove redundant type cast
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
> Changes in v2:
>   - use rproc_boot instead of rproc_attach
>   - move debug message early in the function
>   - clear attach recovery boot flag during detach and stop ops
> 
> Tanmay Shah (2):
>   remoteproc: core: full attach detach during recovery
>   remoteproc: xlnx: add crash detection mechanism
> 
>  drivers/remoteproc/remoteproc_core.c    | 15 +++++-
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 70 ++++++++++++++++++++++++-
>  2 files changed, 83 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 78fb7968943f5064766af7f33d82e6bfe90e0db0
> -- 
> 2.34.1
> 
