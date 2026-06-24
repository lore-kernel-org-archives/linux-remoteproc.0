Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16A930D417
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 14:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782309771; cv=pass; b=OuzD5uoUfMZjim3jLBwv3+gMwrsQ+yUXmpMR80Bd4RY/OXkVPCgK/j0vLq3E8S81pU8iRmpOyv7gFzZ5wC9/bwakjlM7cMrwHGGySaqRulC6XyAOUfo7x9wFaO98nLNpNH4CJhk1jQSALj0WlYboO8ssojlwZGfxWd6cH4v68BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782309771; c=relaxed/simple;
	bh=K8hYqDMpOHlsxH5VoHeLx0MZ5HDU2sHdFlaOaz0fzUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qB0cx+LteHKDrVQRn4YFIHkffK+cFzXJjWkMgsPsWuHu5hf0PKJZ8KMvRDTiY34dPBZmHeWHVMNLoBliS0B+JTlcgsIGkQHa0nCD31fjkNB3YszS2IOcVB20u8DidzVfB9XkfIvU0DSxJ5JD4qI3O/t+dVyNv5Dt59sNaCkqE+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iBIv3LKw; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iBIv3LKw"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-693c69b97e7so1980705a12.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 07:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782309768; cv=none;
        d=google.com; s=arc-20240605;
        b=IqTXYUlPnn5sMIH5n9Ag8QXWonvhS34TYM+M8pJdxU4bzyWwin1HdWGS2o1A0pgEb5
         txuUKC7x/ctNeKsfyAunH+HdUnhJYjrcDJiIJkeFvqeH3nEuskVwbTuDVUPlvGUqijsV
         66HXMhU+I10dyk/VNvQ8E+3z4x8NFL4P/u4ui0/HekhQfs2lglZgweOpPGBgmjEVjyOg
         6mjw/UyH8Hqc/k6bpEMAF81jCKaCp2Iswikiq8bXz8Hqds1CdbFOsBmxZ2Z2U+bEhWHS
         Y1YIVVvA1YzFLbw71z47YrG1dyb/MC8TxNmO+wWIEBVC6N+2Fe0UaRDcaIZKhnokVfVZ
         Fjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C5vPsYKU56GjNxiaGkkNL7c3r/LVlhBv4KmGsmspM40=;
        fh=c5j8Se2p3q8XcHl/MS+P4kAvO+caXq3AdHUo3yZXen0=;
        b=MklVefQ380+CHLe9wq76KGRzP8DGhAJbKBT2xIYnXFbcfwNwZDSpRqJdcRaqtGHpyw
         4iAaKh3Dl90G7r5KYzpflGoAQFRalr9X8Ht80RYLa5IAhshP3KNxUHDiOzjV5OhURpjW
         2SP2834XIX2F95k3eZdVacc+lVU5k7QT2QsSKx33jh7c+u/jn0JYX5p/hiOZ87FZO4zF
         JXPCXCQ9AYyAeccTu9YO9LoHMEFuHqkqpkzIXLAGCVdmi7zsDSo13NxMuGS67tSyTVWb
         NEnPvuzrcp0LzQJwIZRoiv8CQrMJbS2IwX7RyjcTSA8rfakVfjknBkr/DPfAltaK7TAc
         H7mQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782309768; x=1782914568; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C5vPsYKU56GjNxiaGkkNL7c3r/LVlhBv4KmGsmspM40=;
        b=iBIv3LKwNlL3KNBostvpufccZxAtQ9taA6ifXbnc+bS0wQaUpXLP1t4yPllyFjuGAH
         SWFNTOO0VjgMusAKWS0+jcyp+VugD8EflkxzREKwugKIBw6c7d/mypiKrppem92VSByc
         gIxkEHK9gdbn/b0jflutoGT7xT+TwtdWGimR5tOVLtxVfYwiAWtdzP65m9uKPX7lxOkj
         iqwZOBnYzHRjixODncObXOHujPaOQlrjGzfYsQAGqGNBWepG7G7bmehtrgsf2ZaBxaAr
         P5OFBqLrCAUke2wFPfyTaQEHpZPHx4FlY1QEXqElqWL2gz+rELMvqFya/SDc2k4t2tRt
         5E7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309768; x=1782914568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5vPsYKU56GjNxiaGkkNL7c3r/LVlhBv4KmGsmspM40=;
        b=ffB1RKWcXb3myyWRr2ttnK4NCU6+j+GVj1LJsXSf29+UqlP0+fMq6ZVYJio70siRZ0
         LZ52gah6khBkut2w5U1Iq3cRl1621YgKEKV5f2KeGIWbmvOEOqNMd0D9O3sbiY1E17CE
         uMRKk1vb+Hc8Sr3SBxZnTF89dnskQ2lpH2+x58QhQDTdqlv8UQoYR/RYPIUJweV0nxVx
         XZrC/U1JdwdiWO7HRQb5fz2pFuPCKb7xcrI6lHdkf0qMfgGfEiychmZJSJnPJjXc70ao
         z057GT8XK2J1k9EYu8luvuVFeuG2OxAv5pDK7l8AbR4unA9yXVP/HHjA2P2LCIT193K5
         WtcA==
X-Forwarded-Encrypted: i=1; AHgh+RrLJtDWJxcG4lNZWUq2muNarDvKta7Y613tTzEv1m5U/YpAQBYhWvNKa/Crg182J2Tszrcc6q5tNn/s4eTJgEui@vger.kernel.org
X-Gm-Message-State: AOJu0YzIKCSvVdMhAKxbNftpmDI1aaNDfRikwePEMynp6FdfSLH5e41n
	8x6An9mA6LaojqsfBNk2Z0soeWXm8SV2z/Qj9rq4pVBhfaPBNOR76vJwUqfN6MyEFbuHxQ5rGaS
	7KOjMdblEtoaj12Z565xTNINIvRORknkzMBBO2mhsag==
X-Gm-Gg: AfdE7cmVohAOKAUZNmeJIaP2kc5qJAA91W6LwnO3/4j4J1KWcMLMKWoP/ibEdheH+uv
	D4ACxXz+2I69O0ByCU5TR6mcs6Y/gvtHisSIoIIEbln4eESXUJX56H/R3xf4udwcISOK83IerbU
	7SHNi6OJc1xP5KUiksIkZIxPDvdp0mjq/czZslSOSoPs8K1BvYcweBIAR2ifhEhfNxhwkSb0I9U
	Oo3neevLIFVImULOKpng01AVWU5gJCRvBdZkVjkYmOIKV1NUcRAG23Kj4+XZs3u6Rl6xHz4nyQ9
	EIGbuKomwPdzLqvUSHUJc3duWPWgqOE=
X-Received: by 2002:a05:6402:440b:b0:697:e953:d14d with SMTP id
 4fb4d7f45d1cf-697f3aa2104mr2007565a12.17.1782309765856; Wed, 24 Jun 2026
 07:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619163854.410392-1-tanmay.shah@amd.com> <4a4e518a-61e6-4beb-aaeb-5056fbe2a07a@amd.com>
 <a9baf2c9-d4d9-4152-9188-c33fce2daf15@amd.com> <59d9a4c9-1f12-4de9-a0d6-613d2f5e9852@amd.com>
In-Reply-To: <59d9a4c9-1f12-4de9-a0d6-613d2f5e9852@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 24 Jun 2026 08:02:31 -0600
X-Gm-Features: AVVi8CeQVOpe99Jjc0PPT9NZRQIiG1kyiEoqLQu9TzeJnqoNqUneCuzFYP-6rA4
Message-ID: <CANLsYkyChucfAY1wKvxAt9-tCX=2B5L9=4bbBA6XvnpBnLZD5Q@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: xlnx: refactor start & stop ops
To: Michal Simek <michal.simek@amd.com>
Cc: tanmay.shah@amd.com, andersson@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Jun 2026 at 00:12, Michal Simek <michal.simek@amd.com> wrote:
>
>
>
> On 6/23/26 00:29, Shah, Tanmay wrote:
> > Hello,
> >
> >
> > On 6/22/2026 7:25 AM, Michal Simek wrote:
> >>
> >>
> >> On 6/19/26 18:38, Tanmay Shah wrote:
> >>> Current _start and _stop ops are implemented using various APIs from the
> >>> platform management firmware driver. Instead provide respective RPU
> >>> start and stop API in the firmware driver and move the logic to interact
> >>> with the PM firmware in the firmware driver. The remoteproc driver
> >>> doesn't
> >>> need to know actual logic, but only the final result i.e. RPU start/stop
> >>> was success or not. This refactor keeps the remoteproc driver simple and
> >>> moves firmware interaction logic to the firmware driver.
> >>>
> >>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>> ---
> >>>    drivers/firmware/xilinx/zynqmp.c        | 93 +++++++++++++++++++++++++
> >>>    drivers/remoteproc/xlnx_r5_remoteproc.c | 68 ++----------------
> >>>    include/linux/firmware/xlnx-zynqmp.h    | 12 ++++
> >>>    3 files changed, 110 insertions(+), 63 deletions(-)
> >>>
> >>> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/
> >>> xilinx/zynqmp.c
> >>> index af838b2dc327..f9a3a95b0638 100644
> >>> --- a/drivers/firmware/xilinx/zynqmp.c
> >>> +++ b/drivers/firmware/xilinx/zynqmp.c
> >>> @@ -1513,6 +1513,99 @@ int zynqmp_pm_request_wake(const u32 node,
> >>>    }
> >>>    EXPORT_SYMBOL_GPL(zynqmp_pm_request_wake);
> >>>    +/**
> >>> + * zynqmp_pm_start_rpu - Boot Real-time Processing Unit (Cortex-R) on
> >>> SoC
> >>> + *
> >>> + * @node: power-domains id of the core
> >>> + * @bootaddr: Boot address of elf
> >>> + *
> >>> + * Return: status, either success or error+reason
> >>> + */
> >>> +int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
> >>> +{
> >>> +    enum rpu_boot_mem bootmem;
> >>> +    int ret;
> >>> +
> >>> +    /*
> >>> +     * The exception vector pointers (EVP) refer to the base-address of
> >>> +     * exception vectors (for reset, IRQ, FIQ, etc). The reset-vector
> >>> +     * starts at the base-address and subsequent vectors are on 4-byte
> >>> +     * boundaries.
> >>> +     *
> >>> +     * Exception vectors can start either from 0x0000_0000 (LOVEC) or
> >>> +     * from 0xFFFF_0000 (HIVEC) which is mapped in the OCM (On-Chip
> >>> Memory)
> >>
> >> here
> >>
> >>> +     *
> >>> +     * Usually firmware will put Exception vectors at LOVEC.
> >>> +     *
> >>> +     * It is not recommend that you change the exception vector.
> >>> +     * Changing the EVP to HIVEC will result in increased interrupt
> >>> latency
> >>> +     * and jitter. Also, if the OCM is secured and the Cortex-R5F
> >>> processor
> >>> +     * is non-secured, then the Cortex-R5F processor cannot access the
> >>> +     * HIVEC exception vectors in the OCM.
> >>> +     */
> >>> +    bootmem = (bootaddr >= 0xFFFC0000) ?
> >>
> >> and here you have different values without any explanation why.
> >>
> >
> > The value in the comment is correct, but the check is done for all of
> > OCM address range. This is just refactoring of the interfaces and not
> > the actual logic. There is a separate patch which actually refactors the
> > logic, I will send it later. I would like to keep this as it is because
> > this was originally there, and the intent of the commit is not to modify it.
>
> ok.
>
> Acked-by: Michal Simek <michal.simek@amd.com>
>

Michal - do you prefer that I pick this patch on the remoteproc side?

> Thanks,
> Michal
