Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557E12641C6
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2026 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153608; cv=pass; b=Bsr8IEvhiCMOsSPUmtNGIxoarFZ9SeYDj/WnipNVCIwYr4W7caXddROn6Qozxlt9umy/+2TDCf5RS5WrdE5xdlZfKdVWRIaQh9eHBbMHDq3mJv5Jd61w2lyZId8YcIfVIgc0+E93PRsijGWa5uszi3FTHzejgJfDpitM3bA5iDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153608; c=relaxed/simple;
	bh=3hxsgca2g9RoLo8yfPdqDCDUD9qWEnY1C9kxyyUjz8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gvi91VvUHqZbgA02a7BB9EFvLmVBIZ3Bthy5bmkxwKKUubXG9IrbOmY0ZUnivasMB/0y5j5qyTOMDxofcOadzWLOyhhscUO+ZB2l7dujCnvaytAJEnovrTQLVCvnfwnWbtcHek9m2reKhmSe2CkJpo4xyvZtIN6BvDvTXvKYhX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lbbj5muA; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lbbj5muA"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a3fda88184so1539626a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2026 08:33:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787153604; cv=none;
        d=google.com; s=arc-20260327;
        b=hKm+0/ZlnJItQ/dt9auls3EeK/GQ9Osc37i5QTGZoHCZBRL9oxylff59WhgDAGczH4
         zkYVpRmmKc0R+6er+ojekTD4G2RklxftqRrKXYemWGFuiwlGuHonaeltdkc++6Z84QZ9
         leDkbgPNk23pYQzTSugtuc44Btba4M0XZaMYW32lackIzZI1nLdGgwoIuoiaR+kyWF6c
         eHuKKQj2GheSWo6FHAB+98TGz7B9mrQYiDw2v/IDC4nb1EMXWpTn1mNWbnz9M2H4KLEZ
         xFqv0jB/tcdhhjI25qZcpXfWitGEWYOPSDuEddXwoh8FypsSYN/ByvOXADA7uJzx2uue
         Sf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OVKw+JEMW8bGEtLQFyonvySxM2CfZBSHrOWS/+jTeUg=;
        fh=xybgmLf00hkETpDAkRy2rxgMpNghgv7RrMD08uSQ4VI=;
        b=kCUc5+E2EXEw0uwbJHawpEKXesiSGf54Ri5eNbNPvFhtg+r1jDtna8iHvoanq3R21A
         QFG0u7VmMerlLaB1k7Wv6jv54q8lssxW+rBpkvX1z4iPd4+F+dQsQbOGVUwfXN8S8EOB
         +CGoaHD1in0OxrBunz8iWnxb3wndelAQrbInLEhJn3Zitx4LA+tHfpUWY0faGzH2Tp2p
         tgd/HRe5uE8aioRyn6RyaWSdwjOr47CQUQLVohzqTBzXbeTh3I8V8hsIdtNENJyqhhcL
         jiG6ltiRgLzJx+cLPZ/LB1Z5KHn4ism7ECAJvbqXfC5ZOI4flPkBhdkNXl1KFvatlvZH
         UWJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787153604; x=1787758404; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVKw+JEMW8bGEtLQFyonvySxM2CfZBSHrOWS/+jTeUg=;
        b=lbbj5muAQKK+qv1MlsqszBKBqsDbL7VxPbKu40fC9OCWxjbwmMEQ4CWBSfaVEu69aU
         fzAdwYCj9BajW/saPT08chSvHxW5XNvDy6C4S9dFxieZDp4SNSjZswDcJjzXHU4lXlNw
         NMPIIuLJ3hIAwMpqZ0Q3hP8I2cxcyCp9Sr6BldzTi9qKWP5r69u5ZGVVbWeZe2IdRNBt
         HdKw5bP4eyFS9qQMC5JZgKd3tgNw9KfhmGdiv11XS/qM3ajbjn5zKtu21jSRCHf9b609
         CKmK0lRWsYNz4AQ0fE+9atcZeeb01hpdzzcpadBxZFdwxD0CVzMv8DEYitFX8HAiQUx3
         LRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153604; x=1787758404;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OVKw+JEMW8bGEtLQFyonvySxM2CfZBSHrOWS/+jTeUg=;
        b=Jhen6MipQQB89m3T9RnwhVLfBSrkJcZxbKmRNHM3t+om5fKbhV3n2EceXEMsMMtlbj
         SHqsPcljHZPHD/LHobdUBq4WtOBJrMR2Axm0gx+IbgaSdkFabvrXtBSDMANk3Ezlwq51
         RWN9lR4ZJvqv3pXWi8o2blG0DV88scp8ja7AAyG8TjunkOiyBIvrFrnxHOxktCXz29VF
         LbXkhj4/qSYD67Www6ctsBzo69P0IQx0q0GHOg17sHECFn/L9dSCVlb/DZ+Pt7rFup/f
         YoUnEQalgMIXUji7lil+E2llGI20mvvpkBgG1MXvRmkVd3gLi6j/r8NFGO+Ev44BZucH
         HUKg==
X-Gm-Message-State: AOJu0YwybPD5akK+9WUU1UR6ewdEksIYmk5nXLYt4lPKj+xa0OgWyTGm
	veF+oVFT0s5aqw+V0vf1ps/TEe02h2xgbfGhZsQPg59R8NL77Q6/txITxQ8yKDAbbBlwI93XrIx
	RTNCmdNENt1SFx5JdVaaQThTXwEIogHfASPDDqaBp3nwahzYqz3P0
X-Gm-Gg: AR+sD10chMbQ+EKNirl50CIvHce5mYJ6P9n1o3ehRGFP2IP7+f3z5EOM0kHb+trN5pw
	q5oZKZRBkLm4MyZRpP9Z5k1JUgcuDGxhO4z/VsA7yMiQtuBse79/TQeuznH1kIlihrqRnOvXtIY
	DJKOegAzIJnRcbxSi/auhS972jvJxdxwtbASMuPX7FRnPvJI5oi7UD51HjxQn3JVXh/e3TGArnW
	gC98XiXviN0RX71sIZk9+STXIRDGIHbYTbjlFNaKkx8IvEOjV2JXRp+S31hpNtD6u/p7F3HdLDI
	9ooxkDueChRVsbrYqOKJK6CLZxcDoSVxZe7QhVUkBNyXjG8p2zqeZakQNozhSzTRaEqIOtJEMP3
	8srk=
X-Received: by 2002:a05:6402:5052:b0:6a0:a4ce:1b8e with SMTP id
 4fb4d7f45d1cf-6a403216eadmr3321132a12.0.1787153604450; Wed, 19 Aug 2026
 08:33:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202608190009.uCbYi1Y5-lkp@intel.com>
In-Reply-To: <202608190009.uCbYi1Y5-lkp@intel.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 19 Aug 2026 09:33:12 -0600
X-Gm-Features: AcwNN1VCBB9f9coB-JDkHNcndKcwvN4ueahfKmxoepH1FL2zCjkoBs9XBaUqIbs
Message-ID: <CANLsYkxW7EeVQwH6pJryE6PzfVzVVodGCKbFOmycqffRLZ_SLA@mail.gmail.com>
Subject: Fwd: [linux-next:master 2763/15982] drivers/remoteproc/xlnx_r5_remoteproc.c:837:49:
 sparse: sparse: incorrect type in initializer (different address spaces)
To: "Shah, Tanmay" <tanmay.shah@amd.com>
Cc: linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Tanmay - please have a look.

---------- Forwarded message ---------
From: kernel test robot <lkp@intel.com>
Date: Tue, 18 Aug 2026 at 10:59
Subject: [linux-next:master 2763/15982]
drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse: sparse:
incorrect type in initializer (different address spaces)
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: <oe-kbuild-all@lists.linux.dev>, Mathieu Poirier
<mathieu.poirier@linaro.org>


tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
master
head:   e6664f2b33db9b6811eb4cec109f06cb2b4f458d
commit: 5ae3dc078874693a0a7fd1cf32660bd473fe544d [2763/15982]
remoteproc: xlnx: Add crash detection mechanism
config: arm64-randconfig-r111-20260818
(https://download.01.org/0day-ci/archive/20260819/202608190009.uCbYi1Y5-lkp@intel.com/config)
compiler: clang version 24.0.0git
(https://github.com/llvm/llvm-project
844a18e753e822736c9805ab779144b647a2c186)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build):
(https://download.01.org/0day-ci/archive/20260819/202608190009.uCbYi1Y5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190009.uCbYi1Y5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/xlnx_r5_remoteproc.c:571:20: sparse: sparse:
cast removes address space '__iomem' of expression
   drivers/remoteproc/xlnx_r5_remoteproc.c:749:17: sparse: sparse:
cast removes address space '__iomem' of expression
   drivers/remoteproc/xlnx_r5_remoteproc.c:773:24: sparse: sparse:
cast removes address space '__iomem' of expression
   drivers/remoteproc/xlnx_r5_remoteproc.c:797:25: sparse: sparse:
cast removes address space '__iomem' of expression
>> drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *rsc_offset @@     got void [noderef] __iomem * @@
   drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse:
expected void *rsc_offset
   drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse:     got
void [noderef] __iomem *

vim +837 drivers/remoteproc/xlnx_r5_remoteproc.c

   832
   833  static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32
rsc_type, void *rsc,
   834                                  int offset, int avail)
   835  {
   836          struct zynqmp_r5_core *r5_core = rproc->priv;
 > 837          void *rsc_offset = (r5_core->rsc_tbl_va + offset);
   838
   839          if (rsc_type != XLNX_RPROC_FW_CRASH_REPORT)
   840                  return RSC_IGNORED;
   841
   842          r5_core->crash_report = rsc_offset;
   843          /* reset all values */
   844          r5_core->crash_report->crashed = false;
   845          r5_core->crash_report->crash_reason = 0;
   846          r5_core->crash_report->crash_reason_str[0] = '\0';
   847
   848          return RSC_HANDLED;
   849  }
   850

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
