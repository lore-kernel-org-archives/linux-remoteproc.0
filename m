Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51F825763
	for <linux-remoteproc@vger.kernel.org>; Thu, 28 Mar 2024 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711637592; cv=none; b=l9te2F3WH0xPkI3GD+95BznH6x0J+P1Qc+39OQ8g2Wr/04MbVkaLVoBU7aw+VhX5KZs3PqXRRHUIFzoOf4g49P5QDkypPVfMmmJisCAhvI3abz/I4gbITZmzd4F4EWHQ9crF+qblvTQo+Mc6asqWfhTuckZ+38Qzfh33lK0wv5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711637592; c=relaxed/simple;
	bh=yllE/ulzuaTZgaUUKcL5Rh7zbc6IR27NU9oE5zmX1gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgggiFZAYw27cORmAD+mtTRIxnxK9dZ859wVBGproIFY5of+gFSdtoFNhGY/THhHtKXY7rYkIrwYFSYqSrOAlnjiWD8EN7LsEEsNgaKkmiYyKXG2W0h4uEfvG3ECnmAwx/kfY/PnS2nzfYADQ8fbH5cTC9htHoh/MkOsnWqoxG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l2J9YuLP; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l2J9YuLP"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso784575a12.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Mar 2024 07:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711637590; x=1712242390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i35qdfnmzb8GcWwYT9amTA4CeZI1vlYQS9XoH1d0sPs=;
        b=l2J9YuLPEIlpyI9yhhne6HGu9f049GTSjgQvfvadQMkqm/jljh3/SmaePtnlM2QrL0
         jZDR8A3VgsrLAUHrczUObrU9IVivlSMfciEUHFzQBtOXFWm7+POfdAyrY0A4jWFvHt2L
         UMhKabLVnk5a7LWP1kTfkRhU3zWhExU0rBWmk2NcAXU0h5fblOmnJdxPAY0Dj2EdaU0n
         f6EPGmeORC0RmIGDUQ3thRzH36AuLUeDYkuzit4965DqbmPfyQ4GErcjkIz5xEgl+sn9
         fdHBhzMBTUjKx1VJyzS9In3Pvyuq3P1BGZPg2U1Ca6YEJixPzBGCRD+GXvqpzoLwyoWg
         Wzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711637590; x=1712242390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i35qdfnmzb8GcWwYT9amTA4CeZI1vlYQS9XoH1d0sPs=;
        b=FkVeM4K7PSYoi03h5YiNjxQ0ttGr+uMe2R+ukMGK89vqEhJJxaiR26saWBrqx9ySYu
         xLFuC5v7Nw6gjybrJHKLRciEryY7SlEvh43N/XlcntUoBg4dc4MjUMplCuCGpNrfPgDa
         lzBJjhuGXIZ3cAC++HQSDqvD2b7uV6B0iv+vWVKrMaSV00oKSeypCxzboKZtT0zoIr6M
         yn/c2Lkf1F81liF5/PVE3ltFpM70y7TsLVxo0SKSalo7LR0N37o0d9T4AoBJwt2yU2FU
         CPBHwPVMS/rSxpXbUzd8TKDJkd7qQwwzLKPqBJAEbRXnDm3bI6QxU2TfGSxxSF2hvqo/
         R9Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWABYBU4qSB6c1SCXwMgJFaFfiNKtMp5cnPmtsfDbFUuk0GAuiaA1HEtE/Is6gPZt6ysSkMhbe1h51H0NfbhBOES4pFj795uZMkEEz5opd3iA==
X-Gm-Message-State: AOJu0YyHaVXliawKe2pAv9mFfj/CuTeJjBPGxuZqstozp1JsNjLufnlq
	xqWGwjH48+RFnnnPhXmfKEGs9dVzZo2HKup4SvBYpsBpQor4p4UhlBdj5H9o16Y=
X-Google-Smtp-Source: AGHT+IFmQyWLTIrei9uhVcpsua/EJMAf1wlCb+J0ByUinXtKBfHleN0nvLuKjv1Py6t/0BRIaGnASQ==
X-Received: by 2002:a17:90a:7786:b0:2a0:4a33:c3a6 with SMTP id v6-20020a17090a778600b002a04a33c3a6mr2612491pjk.44.1711637589915;
        Thu, 28 Mar 2024 07:53:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff63:c57b:4625:b68c])
        by smtp.gmail.com with ESMTPSA id c1-20020a17090a490100b002a04eef22c5sm1565909pjh.44.2024.03.28.07.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 07:53:09 -0700 (PDT)
Date: Thu, 28 Mar 2024 08:53:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Leonard Crestez <cdleonard@gmail.com>
Cc: Tanmay Shah <tanmay.shah@amd.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] remoteproc: zynqmp: Add coredump support
Message-ID: <ZgWEUpgmPPfFAjo/@p14s>
References: <d4556268-8274-4089-949f-3b97d67793c7@gmail.com>
 <ZfhxUJjrcYfqt9Nd@p14s>
 <07183fd8-a5a1-4cae-b317-d703ef7c1de1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07183fd8-a5a1-4cae-b317-d703ef7c1de1@gmail.com>

On Thu, Mar 28, 2024 at 10:17:13AM +0200, Leonard Crestez wrote:
> On 3/18/24 18:52, Mathieu Poirier wrote:
> > Hi Leonard,
> > 
> > I have queued patches for this driver that will break this patch.  Please
> > re-submit when v6.9-rc1 is out and rproc-next has been updated, which should be
> > around the middle of next week.
> 
> Hello,
> 
> It's been a while - v6.9-rc1 is out and rproc-next has been rebased on top of
> it. But the coredump patch still applies? I expected some unrelated
> xlnx_r5_remoteproc patches to cause conflicts but there's nothing there.
> 
> It seems to me that the patch can be applied as-is and no resend is required.
> Am I missing something?
>

You're not missing anything.  Back when I wrote my initial comment Tanmay had
submitted patches to fix the way TCMs are initialized, which conflicted with
your patch.  There were some last minute modifications to Tanmay's patchset and
I ended up not applying it, leading us to where we are today.

Tanmay - please review and test this patch.

Thanks,
Mathieu

> --
> Regards,
> Leonard
> 
> > On Sat, Mar 16, 2024 at 08:16:42PM +0200, Leonard Crestez wrote:
> >> Supporting remoteproc coredump requires the platform-specific driver to
> >> register coredump segments to be dumped. Do this by calling
> >> rproc_coredump_add_segment for every carveout.
> >>
> >> Also call rproc_coredump_set_elf_info when then rproc is created. If the
> >> ELFCLASS parameter is not provided then coredump fails with an error.
> >> Other drivers seem to pass EM_NONE for the machine argument but for me
> >> this shows a warning in gdb. Pass EM_ARM because this is an ARM R5.
> >>
> >> Signed-off-by: Leonard Crestez <cdleonard@gmail.com>
> >> ---
> >>
> >> Tests were done by triggering an deliberate crash using remoteproc
> >> debugfs: echo 2 > /sys/kernel/debug/remoteproc/remoteproc0/crash
> >>
> >> This was tested using RPU apps which use RAM for everything so TCM dump
> >> was not verified. The freertos-gdb script package showed credible data:
> >>
> >> https://github.com/espressif/freertos-gdb
> >>
> >> The R5 cache is not flushed so RAM might be out of date which is
> >> actually very bad because information most relevant to determining the
> >> cause of a crash is lost. Possible workaround would be to flush caches
> >> in some sort of R5 crash handler? I don't think Linux can do anything
> >> about this limitation.
> >>
> >> The generated coredump doesn't contain registers, this seems to be a
> >> limitation shared with other rproc coredumps. It's not clear how the apu
> >> could access rpu registers on zynqmp, my only idea would be to use the
> >> coresight dap but that sounds difficult.
