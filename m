Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792687563;
	b=y1XiVANGgcGJyna6YwB7+bTilyMZ2qB8j3F4EEVCCTUwIdm/R71V3/Caj4iofDMTC9JX
	 ztwqJLb88n3dVbVZk9JiUTISgr6govLnlXHqyYasyYojzC0wMjM3G3PSphZyD7GMBoUnT
	 SnrGRhlCJNZYVxGu2XrbTI0sjrDmO7ajvy2UBvRXr4ibDXFw8Swv80pT5VmD1j4Ddy1P6
	 +2rmOR3rVRETzpZ0wvlG3Wk6O5EhIRGB/DKOnXTpDdcySotzV6IrUyGcnKpWDb/xqXY9z
	 b/MhRu6KjMZ9jQxvy4ATasqIayVDnKqkdQFBBaLCQazAQ/tvf+vp3Xq57i2xSvBQPxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=7QjbmIGCrtIQ6tCBoJIzAI0pejSWTsFGJkAT3QK1DP8=;
	b=UKMysUx6MRsagGKwv51ISYh5kj53m6dvziC4JQjP8OIxADrnVAlmD/u7hwxfTokLeAeM
	 ycVUx3RXf/XIwKDpjEm5WuCbL3HGxUTvRzGwE7Swk0UYlSCD5NPFbJGypOlUCbZS9k86w
	 4OH3yZZhIJAG+vYvkfuE6Jp66neZXyntJ5jTQ8y9f0BwNrldMEJ/Ra3ZsjRJgwogImKS7
	 jnE6U806r5Vf4cIP6BEA636GiUKi6JOYsf8+I3i1zJiQP2wsoFncMsjZcbq520H6OffGF
	 3vb/IoZh06Q02FomQOAygvtVEVY9+LwtHn8/V+yqj9bWv9k/zvzn01upbaQHnVPk1Ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M66QCxhz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF823606A31B
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 16:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF823606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M66QCxhz
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b2232d8ef5so3291725a12.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 09:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792687561; cv=none;
        d=google.com; s=arc-20260327;
        b=TUYntVBcPPc+/1n2FYB7PPMhBNxz7qMxSjoe4UAIEIj/dkqDsoBl61vZY7vAixuvas
         7YsEYK9oiM1zZNAjc9Segp3yCNybuv/+COQuYAK/MKdtFiXNEEMtpw9XwTArVJA0tKFs
         LtboJg/eUMte/I9Zqwbtza9qbFFw7Xn2rvATa2Jxw0Dbb5QPl24nEb7hFB0d4A5RDIk6
         ZYC4pJ7Yyiphof0gbAD351wf3OA9anYWE4SLarBthgcTX8Y0qh43NZQpdQ2oBEriz6Sl
         swJPRTgHsMFOvSrNgBNY0H+WE9jgvQzQnTkyE/2AZ0r9cgE8V0UbSvJD0Qj6mPsrC6ay
         ZFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7QjbmIGCrtIQ6tCBoJIzAI0pejSWTsFGJkAT3QK1DP8=;
        fh=NfHiNTeLlrUz7c3TpASQ/p+CBGV7T0IffcMiFn1TmIg=;
        b=nfq6HIsEG/WGqoH91jjxKLgtLwrHuSnmKa0QFyw+I0I3pOI53vnSHNnltsFadvtKD4
         ctgFP48RiB8Vro29sSVxC9BQNc+ua1BC690V7U+0m4IBZ9jTBd8AbwSayUvfp93WFvEv
         5RzdsOwG3LG0wWCNUJXnPrgB3fhOY6PYeadipvUgyqy/UJOyT0krR/oIIfQzVmRaoEOp
         YFm3pwLUIoOmoV1r62DVUSuLBAwxNJhqJELmyOisVi/0sZQki+bmFx+l6kncu6dAuFkK
         0YTLoaa5P/BGWHbT8VmYKyfhMIW9rItxsh6paEKXKfnPyS61HSJonPNWIUR0+YUvY+Pm
         eoAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792687561; x=1793292361; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QjbmIGCrtIQ6tCBoJIzAI0pejSWTsFGJkAT3QK1DP8=;
        b=M66QCxhzgfUbzPqiJ9B/b+kTckyRx1hkamMEguvpk2hjSGiKeiJBuX0xS735bq2Dmj
         PhQfeywaq4e08BZYcqy9/KtlscEKHSVAs7ztL1FoZADZKD8w8UQWQRqM2WuWxphtuQbj
         FWO21f5APdGiFbQj3hGiraGvRPquXWeWLb8zlzomRQFsIQ43jmCxVWYOj00RN04iV7jl
         dNhhPJBqRvFoZWtzvVRtxhDd9EL+YJuxQ0N7WXMXBfNmd5FnsN9aVMR9ug+E0XcSeGFz
         1BNnDqLVJTksD8jHtQ2jmJssSFRiaVieF1/m5QofTNMcXEQE1mej6livTmodsAmhYWyq
         ajnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687561; x=1793292361;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7QjbmIGCrtIQ6tCBoJIzAI0pejSWTsFGJkAT3QK1DP8=;
        b=NXmQQyPz0XrlAQaZkOhBSxvsQO/SgvorcDsUDHyt5wAIcxhptU8I0/DiV9jWUBy1fy
         TUZtIbZCroH48DZiTvd5dAYAW9j2/a7xvx2K+ZDRm/entditEkYJknmJrxhS6eCW8ja3
         whUUIBJ5Xg9z48LFgWqoNOnUzhD468XIX55+jaiOumrvrbpiiSClUClZF6f/n4wrzqcf
         Is+vuemdsFFrFT7qTmSIeWfD+fzHWFcjL8q3EiBNfY7VmRti4OrEBVpfZvD9sSymokNj
         zCHJqXX7ejdF6c0rMIIYBzsWtOo68Hv+KlWMR3tVmAZEdFNA1am5eIhkc45p46GpSG/G
         58YQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTBJbhTgVvdl2OC8LlREQl7VQ4wJF38jVqqWBCQyFiaELnRIKlNbRbTyhDX8UO0apFas5tlis1i7QaU6wi26Xw@vger.kernel.org
X-Gm-Message-State: AFq9FYIK/VwOobzg7WEmaX1K+LKOLfGeoyPRMHrqrwo5s40eqe4QJzu9
	wjrUfXc5kq74w02fcBdMy/9WXYRsZmNoG+rCBEPF9onAarY3XiWSJT61JRSmkntYK9ujIF/w4je
	B7k8oLpVHhpkRH6zg/iergeq/kcXVpJXuqy0ZejZXGw==
X-Gm-Gg: AYBFou1eLegBwGsbjKIZVN1VZTPjN+cycAG33Qn3N/aZ8zPr2LxuRBAfex0nKPtFL9R
	im0TGayDJNuQeWqRZ4yoVCAT9HTYkgXUP6DcQahJhDP0R1WGEn7uOqgC2zvzfVoQxcdz5s8SDEj
	4hpdofJwKN4ZzfpMw6mwxfFFMj2TpXF/PWM7V558hak57v4jtegUvd+ZkGnCHJAfEsb4lk0mKte
	Fh8FdAa3RsvA6mgDZGn/m50OUyIVDNLbjZnfc0YIvjWv0kR2QIP+QzEFtkSYACkkSvhZoxg0z+I
	6zGateCGGMKk35oa6jI6M4ausfjnWHe/Ycjiei5CgE9M29mA7eWzIcXO5U4xzDMTrcBbz35D2fy
	B9yvw0ZQctcYn0sTDkPDMBGwiGxywLFr8SH0KIjAkZKERR98OkLFen35GWhWX5IL5lR0EK8g=
X-Received: by 2002:a05:6402:3606:b0:6ac:70f2:9205 with SMTP id
 4fb4d7f45d1cf-6b408ee83c9mr6292700a12.43.1792687561234; Thu, 22 Oct 2026
 09:46:01 -0700 (PDT)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014103241.3847-1-sid9.karanam@gmail.com>
In-Reply-To: <20261014103241.3847-1-sid9.karanam@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 22 Oct 2026 10:45:49 -0600
X-Gm-Features: AclHuK-ugzsTcBNRw7i6zHWRnWRBooXuVu1JVUz_WJYFo6DEMNRW_AY2qU9QAv4
Message-ID: <CANLsYkzqS=aHojaCefeSyoWHe9cPS9YdMv1331Bm55JF5JmgZw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] remoteproc: Merge ti_sci_dev and ti_sci_proc abstraction
To: Siddharth Karanam <sid9.karanam@gmail.com>, "Andrew F. Davis" <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I will wait for Andrew and Beleswar to review this set before moving forward.

Thanks,
Mathieu

On Wed, 14 Oct 2026 at 04:32, Siddharth Karanam <sid9.karanam@gmail.com> wrote:
>
> The previous version of the patch had a new header ti_sci_dev.h,
> that mirrors ti_sci_proc.h in terms of the struct decl and
> its helper function structure, with the goal of abstracting
> all ti_sci_handle's members like ti_sci_dev_ops from being
> invoked directly in the driver code.
>
> Lore link to the v1 patch:
> https://lore.kernel.org/all/20260922191453.324983-1-sid9.karanam@gmail.com/
>
> Upon discussing in the original patch thread, it seemed
> better to combine ti_sci_proc.h and ti_sci_dev.h's structs
> and merge all their helpers into a single header. That is
> what ti_sci_ctrl.h aims to do: It has the union of tsd
> (ti_sci_dev) and tsp (ti_sci_proc) and both their helper
> functions are prefixed with ti_sci_ctrl_dev and
> ti_sci_ctrl_proc respectively.
>
> The goal of the patch (v2) is to maintain a single source of origin
> for all ti_sci_dev/proc_ops call sites. Any stray calls
> to dev_ops/proc_ops function pointer members in driver code should
> eventually be abstracted through this header (ti_sci_ctrl.h).
>
> In the future we can try to abstract tsd's dev_ops even further
> through pm_runtime, but there are some roadblocks that
> I am unaware of, so that warranties a different patch.
>
> Siddharth Karanam (2):
>   remoteproc: Add ti_sci_dev_ops abstraction
>   remoteproc: Merge ti_sci_dev and ti_sci_proc abstraction
>
>  drivers/remoteproc/ti_k3_common.c         |  21 +--
>  drivers/remoteproc/ti_k3_common.h         |   6 +-
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  26 ++--
>  drivers/remoteproc/ti_k3_m4_remoteproc.c  |  23 ++-
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  |  66 +++-----
>  drivers/remoteproc/ti_sci_ctrl.h          | 177 ++++++++++++++++++++++
>  drivers/remoteproc/ti_sci_proc.h          | 130 ----------------
>  7 files changed, 231 insertions(+), 218 deletions(-)
>  create mode 100644 drivers/remoteproc/ti_sci_ctrl.h
>  delete mode 100644 drivers/remoteproc/ti_sci_proc.h
>
> --
> 2.55.0
>
