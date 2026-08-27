Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F71F45FFC1
	for <linux-remoteproc@vger.kernel.org>; Thu, 27 Aug 2026 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848144; cv=pass; b=EG3VwPGIw/Csr17de284YVwrQr2o8VJAOE22Ae5UEniFNmZQSnuPYM+XyI6UnuVL+nPwwXVys5j6v9NdruFu50Ig6cvjx6lFYFnSZ0ukndgMuYyUdLFGRAxUzQRzhyRTm37b3xq6A/DxFJkf94y4iJ58xtENr6p7luSECBo8lHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848144; c=relaxed/simple;
	bh=WzbhF/qUfb2BU0ixoBiTtd1LisXtP2gSY8BUX/GTghc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9X1qieaAl6vVQ8migbJdkKC62BFnwkFhXXmeSlGf1s/tPGtTK7rMD106RkRLbFup5Zq3TYFArIEhzZaxhQB5PZHWuwFuSvuEfIXmzbEFl1j8xC7XcOuiFlba//CJxjYgTsO/mUyqy27xdrBkYxQwGxuBibvOk+oN8r3xKfZ/iA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QQICBUUM; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QQICBUUM"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so1951976a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Aug 2026 09:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787848141; cv=none;
        d=google.com; s=arc-20260327;
        b=GU0hdxeOG7VY0oUtw2XmJ+MoqppLxurcCKOjA4VwRupN4YI+EoU99DgzD9lj4k8XRp
         728qFQyVz0q1yn/Qid6m7KrUJaCPwTwFTMVhIIVS325WHXrXeH5xM2GJbb1y1eE+73ih
         5mrsNtBI6eFW4a8UPLVZy+bpwlpDTFW9IsJnNXZeuzQOL5/iQb++RjQgf08WgP9vx1cH
         KO7iO2eo1VkiOd83mhsZSA9eP0ttuQLau14x38WpoeLDhFhPfIhVa3Fmqn4kryPXllkY
         fEnXQ0PeNW/l/1EnLQi/PMu2heSFYxHAu0jAMv+j3UlQdA/v+Wk2eAfMFZ3ZTq63X6LX
         rTFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a1IeL4ebzv3UkySj4bOM0KyNJSdUD22zYAnAwZBxGLY=;
        fh=beBg6uaWITAltbuC8qtQu419Vwrlb0wjnFFB9m/A0h0=;
        b=ljmhdAbXbCOy/zSUohkEb8fSrdvii5DIdOzttDedWXQoX5PqdsydekTsq7nRNb2urI
         MBYuXHGxZaNMO1XrTfIjpTEd17ru6/lH1MzIWR2VOcYkozBYQlEChoMBSYrLFavMDUln
         AE5AWc3tzEbPPIK4yATMSm/nABh2yl4po4VmZWQa+u30z3hM19w+1WFtQt62/IW7P9uf
         lVTb3N5pqHpnNSZ+2Huj2AWjpwRd+udTRGVCZXsBw4A60FdyW9ZNWIO/kX+Uz22F/hHx
         pr3v2A4cc+RIW5x2SOgvyCSXbCBytF86f6fC02YQPvY+xUuN+61BElpAiYg5LIakUkYN
         5uVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787848141; x=1788452941; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1IeL4ebzv3UkySj4bOM0KyNJSdUD22zYAnAwZBxGLY=;
        b=QQICBUUMdyKNKYhin/5VMBgedobylXZlkIXFuVoPyXgfTWIzEK6gM/Z01MMXI3mqWt
         nxlRe4dB2A2IGcJt9/DlCE+UZGILv4t04uZj48Qd6E/YrAl0nrriQNWEWJfgwJI0IPiB
         noAxOiDbLdaVV4cp6f54ybAE+A7dRbCWXtBsGz0CFEXXe82lxsVxrUloBlzOoMj9SaPb
         6D6lxVnttpBEhmzJfk01xWWLQSvIA8B+bcznLFbMQclpyQuJrazFzpEffYn9ZnCyI8KT
         EnDFl2qUnFMH2HjANzKLBWJVPKmeNcklO6S3Qp2lLrDXBVt9dB1KyO6xRzlgNGPWwg+R
         T0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848141; x=1788452941;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a1IeL4ebzv3UkySj4bOM0KyNJSdUD22zYAnAwZBxGLY=;
        b=Sh+l63oo8XAgmJoaiPMqSXUmyzDa6pyFz8XDHP4AGMEWRUGTfcaKZ2C2+EwD0p/EBM
         drAV6Bb8m3pDTqPofMwJe+kdXPfE7r8dt8Q848K5wTQfY98Ti1XixZhJ0YwXqO2ZJ+lz
         7qn4fSCjKwkOMlLOCNk7DKRi+vx+E43IADagYPNHzJewwmBUJWRqRhBnzrQge3xF2LWL
         jilem7dwosp22wzmHQqetGeOi5DvBVnO4Vz0MJF2vreunXFx8hA0mPK3t7pR/UHri2PV
         BppPmMTknbeqG6emMmlDKoRD6wS1U35TynZRa+BKlAtceFjHGNJ6xW1MSZNRcDmYDj+c
         bZmg==
X-Gm-Message-State: AFuF++kfaV7MT4OtpcfATgTLDZ9b9lv57HIdVLrIA2mqKMLM7+XoodCp
	wXZyYWdtWKOUWMKWjjbeJD0S8KWGOBm4fDHBKNNKPymy3V0iPTShV5cdV/G4oz+u4cbYIrJCtj4
	MBD9bsauASE1Vib4MSqenG6+WluCcVlbcvBLNuLV7MdM/5dcRGtDy
X-Gm-Gg: AR+sD12LsrWUfSTTwO3Rbattqt+1iUvxVFSlbF1UeI+KyYVJ8Lu3LcTZtQ7okoxDj/q
	ELjZYI39Dfag0QNsJ8VTdAkJR+NdOoflRut+K7yLDfzhJwafUrmwa+bbpPij6JL6mMXDtvqHktR
	vO8tfFrsoGkdtBI/CMmqYVU1XjVdvkighLc9pRyOWjG3RvvbED+oize2fIW7Uta2XcbR/F97OiV
	C3DUZ0xT2e2GQp3XDSzr8/84d3k7VCZcfspTf7210acaI9Tt7uLzn96FLYAOc5elGm6U7+F4zMp
	7CrEELFHTQjlNjIbk+qEBJ8jfxANmd824RKG2TKWRMUVqZVDu5NywHsNaWhm4MRh/p1Obaeq8cq
	d9w==
X-Received: by 2002:a05:6402:501b:b0:6a3:5685:703 with SMTP id
 4fb4d7f45d1cf-6a60c56c561mr306339a12.3.1787848140731; Thu, 27 Aug 2026
 09:29:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202608190009.uCbYi1Y5-lkp@intel.com> <CANLsYkxW7EeVQwH6pJryE6PzfVzVVodGCKbFOmycqffRLZ_SLA@mail.gmail.com>
 <fc762f68-5c8b-4d35-b6a4-d876b9d4272a@amd.com>
In-Reply-To: <fc762f68-5c8b-4d35-b6a4-d876b9d4272a@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 27 Aug 2026 10:28:49 -0600
X-Gm-Features: AcwNN1V5W_G9-IgI1DzPTdDEbjYOVPatgOVJPMIN4PGXvVSOyiA9WqSyMHSXj5Q
Message-ID: <CANLsYkzRTxxCg2UquW0StCrDCaWZaqZUM=jzQz4bf3xsnrP5rw@mail.gmail.com>
Subject: Re: Fwd: [linux-next:master 2763/15982] drivers/remoteproc/xlnx_r5_remoteproc.c:837:49:
 sparse: sparse: incorrect type in initializer (different address spaces)
To: tanmay.shah@amd.com
Cc: linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Aug 2026 at 15:05, Shah, Tanmay <tanmays@amd.com> wrote:
>
>
>
> On 8/19/2026 10:33 AM, Mathieu Poirier wrote:
> > Tanmay - please have a look.
> >
>
> Hello Mathieu,
>
> I looked into this. So, I can silent sparse by using __force sparse
> annotation, but that's not the full solution. I think to properly
> address these warnings use of ioremap*() APIs should be replaced with
> memremap() API. This ensures that DDR reserved memory is not mapped as
> iomem, and correct pointer type is returned.
>

Sparse complains when an __iomem * gets typecasted to anything other
than a void *.  I don't think there is a need to use the memremap()
API because all that does is assigned the value of ioremap_xyz() to a
void * before returning the value.

Looking at the errors reported herein, it is possible to use a void *
and then casting that to another type to keep sparse happy.

> However, this needs serious restructure in the driver. It will take me
> some more time to address this issue. Until then I prefer to keep the
> sparse warnings.
>
> Thank You,
> Tanmay
>
> > ---------- Forwarded message ---------
> > From: kernel test robot <lkp@intel.com>
> > Date: Tue, 18 Aug 2026 at 10:59
> > Subject: [linux-next:master 2763/15982]
> > drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse: sparse:
> > incorrect type in initializer (different address spaces)
> > To: Tanmay Shah <tanmay.shah@amd.com>
> > Cc: <oe-kbuild-all@lists.linux.dev>, Mathieu Poirier
> > <mathieu.poirier@linaro.org>
> >
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > master
> > head:   e6664f2b33db9b6811eb4cec109f06cb2b4f458d
> > commit: 5ae3dc078874693a0a7fd1cf32660bd473fe544d [2763/15982]
> > remoteproc: xlnx: Add crash detection mechanism
> > config: arm64-randconfig-r111-20260818
> > (https://download.01.org/0day-ci/archive/20260819/202608190009.uCbYi1Y5-lkp@intel.com/config)
> > compiler: clang version 24.0.0git
> > (https://github.com/llvm/llvm-project
> > 844a18e753e822736c9805ab779144b647a2c186)
> > rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> > sparse: v0.6.5-rc1
> > reproduce (this is a W=1 build):
> > (https://download.01.org/0day-ci/archive/20260819/202608190009.uCbYi1Y5-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202608190009.uCbYi1Y5-lkp@intel.com/
> >
> > sparse warnings: (new ones prefixed by >>)
> >    drivers/remoteproc/xlnx_r5_remoteproc.c:571:20: sparse: sparse:
> > cast removes address space '__iomem' of expression
> >    drivers/remoteproc/xlnx_r5_remoteproc.c:749:17: sparse: sparse:
> > cast removes address space '__iomem' of expression
> >    drivers/remoteproc/xlnx_r5_remoteproc.c:773:24: sparse: sparse:
> > cast removes address space '__iomem' of expression
> >    drivers/remoteproc/xlnx_r5_remoteproc.c:797:25: sparse: sparse:
> > cast removes address space '__iomem' of expression
> >>> drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *rsc_offset @@     got void [noderef] __iomem * @@
> >    drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse:
> > expected void *rsc_offset
> >    drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse:     got
> > void [noderef] __iomem *
> >
> > vim +837 drivers/remoteproc/xlnx_r5_remoteproc.c
> >
> >    832
> >    833  static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32
> > rsc_type, void *rsc,
> >    834                                  int offset, int avail)
> >    835  {
> >    836          struct zynqmp_r5_core *r5_core = rproc->priv;
> >  > 837          void *rsc_offset = (r5_core->rsc_tbl_va + offset);
> >    838
> >    839          if (rsc_type != XLNX_RPROC_FW_CRASH_REPORT)
> >    840                  return RSC_IGNORED;
> >    841
> >    842          r5_core->crash_report = rsc_offset;
> >    843          /* reset all values */
> >    844          r5_core->crash_report->crashed = false;
> >    845          r5_core->crash_report->crash_reason = 0;
> >    846          r5_core->crash_report->crash_reason_str[0] = '\0';
> >    847
> >    848          return RSC_HANDLED;
> >    849  }
> >    850
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
>
