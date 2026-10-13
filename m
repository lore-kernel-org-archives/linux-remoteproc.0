Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70C45326DD
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 15:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906670; cv=pass; b=FyUhzIC0T0VjSPQsifbXBxGJv6o5ydKu2tOeDNwacN6+KVpmSW6oaT8LdG03oKGM3Q0/+MnARtSAVYmdlAgkICK9XhH9H/lquKc9ZqsnpUn0ss7AYCoPr4q9Wdz5OH+jcBEOdgtNDG7DtzmJoXlURXzwwWxQk8His/vIL4oLPCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906670; c=relaxed/simple;
	bh=Q4UBMAGWhhEVRnP3zqrfXfr3Ih1PNjg6Ld/IKdYbwko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HuUOVh4knAm4fnVV/vl7ZcV+4Roa9WW/XUSW+JanCS64Zc+3G9GMzPLz7NN03TVaq13d61mXBdm1Jfm7kR7u82UK+kuCgWznVPjXej45dUVsqH+/7UeBLVVNpdtICpuO1NT2SlYsClrBJFBpXVR9T5BUiinO4j3M+QX8Kr52yeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yEhDuHqc; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yEhDuHqc"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so3046839a12.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 08:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791906667; cv=none;
        d=google.com; s=arc-20260327;
        b=iCow9DQiOm1X+TuGvyJT+jBLKtTQuaIUhcGo23g/AOUX64U2bLAtIxVXvePZqtKlZc
         wSeMNZmdg5EmBu1rDUeDNMKwwHmvbC/HvrSSc3tyq0k9h9Y5+SVz7V4hw3YrNeREzsQc
         wKQsLyTs8Mb+4Vobje7Xc3BE5lPlGvMG+f3H6pPdMklSVN7fXrafH7yTZuH9+bREXWZi
         rrjEsV9lDHsPsWEtrU4hoY5fI3MzKatk1l+D0LU3dbtxl4W649uUdfmhLzz0QEtWC6U9
         qWfIW3WMY8jO6j8eFF+jua2sQS7Kqtqvs7eWv7e0j4i6ZTohc0rlu2DVV1zlTU+dPHDi
         u/IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hI07ZP6ZXwusJOkVivRK7QwgdEDXZj4ua4bdxFOQrYY=;
        fh=K8KFq4J7JmUo/S5rOoz+oP57CtSCjgK2qYPRgk7aMLg=;
        b=L8pD9TID8CykS+MvE53SUlM2tLL+S6HV6aHJ2XngQEl1P6WGyaZKgqpauYSsuLXgmf
         txbJjj+pYqPy67uI4VK7vy2gDtUXye/zh4e3FwiJ4esykcBgR2ssRNaY09RozffFsAsN
         yH+ZEljMdLcA6vfTQWM/mlhkMZW+Lo/tTs03sagMs39nhVGkl2ewFOcXQT0uiJsEQQh/
         5Wrut/bYo0higAbGVJeKjQCDkPrdN60sUE8vn4Vgo72L0rWsiwRgI8SxzdhSH4aDQemz
         dISBrMkJ27Dl9Z3JUzE6eH6pfmOBYOlGbH1Y2p1MphtrxbJbgKI8OuRwcxO0KkFHohox
         7VeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791906667; x=1792511467; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hI07ZP6ZXwusJOkVivRK7QwgdEDXZj4ua4bdxFOQrYY=;
        b=yEhDuHqc02rY4uLwaq2K96RrAl2+7oZEuxZpvExsEVeTlLk2O25NCF8GUuDsiUP0oU
         aS/9jv2+HGXvGZq9+lrANV4Dmt1OZrjU0uBrE73OxCQXEVrGKz6aFopaZ53MsvnUrU97
         O8TnzyvZ6LvADtV1eyMkgtLB8NukJIqvbAvbEDkfrl1UOqNeWtg5hujxYEolq6dyxlYr
         8zxYRtbm5iCxGGGr+lpGvPqN4m/8YHAOZ/qdmRZAnKVeJpd33ShCDNt9PWa4hCJGjsV/
         nb5qW3Q1V5/W0nSIyJcoI6YYFYpRCrM0JjuE1OpOAXqWS6JBpCitN4/d7erP3JAKs0IF
         Kxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906667; x=1792511467;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hI07ZP6ZXwusJOkVivRK7QwgdEDXZj4ua4bdxFOQrYY=;
        b=wa+NIrUTGrfOVA0AiKeutJLRNXIZQOhMTl0x5K0VaiD4vQebsGLyLdsiFz20nPWG8Z
         ZctzeD4NpWy2dugfDfCEyO+pofZiesQraVUSH7v3SqBVf9HqfXUyOdy+ca+Zp1zzS0Ny
         qEKgNGT+O3SVHRNALzJQVJGHeWBRu0uUyiKnwOKqGxu+y9phDLd3STMSNg0U7sJzqHCy
         El213A1m8q6U/YrODQci3mK3JjWiM2nmCb8EtoX2nPYr3Yg0BwYlaEuKlo14t9aseCnb
         cyWI/NGHIJib7SB3bpSFTw7TTq+slH8hlf2Rtolfk1ufUy6yxeWnL8i16QIrpPz0mxwC
         n8cg==
X-Forwarded-Encrypted: i=1; AKwUvBzaf0NkCt+V6rQDDnFvpA31CGXN2Mel7RphH86t98GE7RSJ8S7YHA3qD2zoTbx0QV4tlXrb9iah6T15M2s6HFU2@vger.kernel.org
X-Gm-Message-State: AFq9FYKo5kJG6GofZbeJLM9IO8ZY4PWjGoEvumoieI+3nHoVVZmn1lik
	6Iwud6IPnGm12gyd0W4mec6agEWR9RwgdeerE3miFsIEIZjfW9WOcItNAQGpFjIuT30MGYvhpeO
	ESQ890rBPe7i1uv4ns/U0uEDuXCzBVnJfd86A8WLhSg==
X-Gm-Gg: AYBFou1TAVm5pSoLFRbFvuIB8Q3DxNXBOw8XFIBTR3uS8RIwZSS5Tl4STqrOslTnYIr
	dmV2qulyo1mfGdLWTEtnnokwYqdVVraOBJj+DG+zOdn2Vv6glXqzSmYaPtqjfWrzlUUTyqEYCIV
	byPAq8ElSmuqJmJoMgFBCPOiDCj8ZIxfUaywIfEntVb3TVxZXBk6zGHbYqHFpFDX+fFUO5pAKIw
	nSUKxN1F2Hn+b8e6Hgf5mQqgSvUh25JAXcRWRrgZgKFYbLe6jRcbj37pqTN6wEbZ5OG/4iMRdiS
	srMdihdowOO+TJdGlFs5ph71GkZct5QUIqnGNZo1GQxGtItZlqZVl19w2yLBL765z0Q92NeVatz
	38l9iWrPwVBunGQ==
X-Received: by 2002:a05:6402:a0d6:b0:6ac:94cf:9f2e with SMTP id
 4fb4d7f45d1cf-6b17c237c33mr9912940a12.13.1791906666943; Tue, 13 Oct 2026
 08:51:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927172428.110718-1-saileshnandanavanam@gmail.com>
In-Reply-To: <20260927172428.110718-1-saileshnandanavanam@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 13 Oct 2026 09:50:55 -0600
X-Gm-Features: AclHuK_YwVU186w8Jrj9q5z-jVTTxDtnLd64spTZ-oYlvApDkqCGECWJiLiypDQ
Message-ID: <CANLsYkwDMdsoxNcYPH7TS=AQV4a=R6HN=Vmx7WOWyh9GTrsQVg@mail.gmail.com>
Subject: Re: [RFC PATCH] remoteproc: core: add KUnit tests for rproc_check_carveout_da()
To: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Sept 2026 at 11:24, Sailesh Nandanavanam
<saileshnandanavanam@gmail.com> wrote:
>
> Add a KUnit test suite covering rproc_check_carveout_da(), the
> internal helper that validates a resource-table-requested (da, len)
> pair against an already-allocated carveout's bounds.
>
> The test is #include'd directly into remoteproc_core.c (a pattern
> already used by mm/damon/) rather than built as a separate module,
> since rproc_check_carveout_da() is static and this avoids adding an
> exported symbol purely for test visibility.
>
> Six cases are included, exercising every branch of the function:
> requested length exceeding the carveout, a specific da requested
> against a carveout with none set, a da before the carveout's start,
> a (da + len) past the carveout's end, an exact boundary fit, and the
> FW_RSC_ADDR_ANY skip-check path.
>

I will look at this patch when I have reviewed other patches in my backlog.

Thanks,
Mathieu

> Verified via:
>  - QEMU (x86_64), booting a kernel with CONFIG_REMOTEPROC_KUNIT_TEST=y
>  - tools/testing/kunit/kunit.py under UML
>
> All 6 cases pass in both environments:
>
>     # remoteproc_core: pass:6 fail:0 skip:0 total:6
>
> This is posted as an RFC to check whether this structure (test
> headers embedded per-file, DAMON-style) is the preferred approach for
> remoteproc before expanding coverage to other files in the driver
> (remoteproc_virtio.c, remoteproc_sysfs.c, etc.).
>
> Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> ---
>  drivers/remoteproc/Kconfig                    |  10 ++
>  drivers/remoteproc/remoteproc_core.c          |   4 +
>  .../remoteproc/tests/remoteproc_core-kunit.h  | 130 ++++++++++++++++++
>  3 files changed, 144 insertions(+)
>  create mode 100644 drivers/remoteproc/tests/remoteproc_core-kunit.h
>
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 5b56b2dcc725..dc5a8f483693 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -390,6 +390,16 @@ config XLNX_R5_REMOTEPROC
>
>           It's safe to say N if not interested in using RPU r5f cores.
>
> +config REMOTEPROC_KUNIT_TEST
> +       bool "KUnit tests for remoteproc core" if !KUNIT_ALL_TESTS
> +       depends on REMOTEPROC && KUNIT=y
> +       default KUNIT_ALL_TESTS
> +       help
> +         Enable KUnit tests for the remoteproc core, covering internal
> +         helpers such as carveout/address-translation logic.
> +
> +         If unsure, say N.
> +
>  endif # REMOTEPROC
>
>  endmenu
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 1ed406714849..4f0ad28305d2 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2839,3 +2839,7 @@ static void __exit remoteproc_exit(void)
>  module_exit(remoteproc_exit);
>
>  MODULE_DESCRIPTION("Generic Remote Processor Framework");
> +
> +#if IS_ENABLED(CONFIG_REMOTEPROC_KUNIT_TEST)
> +#include "tests/remoteproc_core-kunit.h"
> +#endif
> diff --git a/drivers/remoteproc/tests/remoteproc_core-kunit.h b/drivers/remoteproc/tests/remoteproc_core-kunit.h
> new file mode 100644
> index 000000000000..615a854fffbf
> --- /dev/null
> +++ b/drivers/remoteproc/tests/remoteproc_core-kunit.h
> @@ -0,0 +1,130 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _REMOTEPROC_CORE_KUNIT_H
> +#define _REMOTEPROC_CORE_KUNIT_H
> +
> +#include <kunit/test.h>
> +
> +/*
> + * Tests for rproc_check_carveout_da().
> + *
> + * The function is static, so this header is #include'd directly at the
> + * bottom of remoteproc_core.c (see CONFIG_REMOTEPROC_KUNIT_TEST), giving
> + * it access to the symbol despite the lack of external linkage.
> + *
> + * rproc_check_carveout_da() only touches &rproc->dev for dev_err() on
> + * its failure paths, so a zeroed struct rproc is sufficient here -- no
> + * device registration needed. dev_err()'s formatting chain
> + * (dev_driver_string() -> "" on NULL driver/bus/class, dev_name() ->
> + * NULL on an unregistered device, and the kernel's own %s NULL guard
> + * in lib/vsprintf.c) is safe end-to-end against a bare zeroed device.
> + */
> +
> +static void rproc_test_check_carveout_len_exceeds(struct kunit *test)
> +{
> +       struct rproc rproc = { 0 };
> +       struct rproc_mem_entry mem = { 0 };
> +       int ret;
> +
> +       /* mem->len = 0x100; request len 0x200 with no da constraint */
> +       mem.da = FW_RSC_ADDR_ANY;
> +       mem.len = 0x100;
> +
> +       ret = rproc_check_carveout_da(&rproc, &mem, FW_RSC_ADDR_ANY, 0x200);
> +       KUNIT_EXPECT_EQ(test, ret, -EINVAL);
> +}
> +
> +static void rproc_test_check_carveout_da_any_mismatch(struct kunit *test)
> +{
> +       struct rproc rproc = { 0 };
> +       struct rproc_mem_entry mem = { 0 };
> +       int ret;
> +
> +       /* caller wants a specific da, but the carveout itself has none set */
> +       mem.da = FW_RSC_ADDR_ANY;
> +       mem.len = 0x100;
> +
> +       ret = rproc_check_carveout_da(&rproc, &mem, 0x1000, 0x50);
> +       KUNIT_EXPECT_EQ(test, ret, -EINVAL);
> +}
> +
> +static void rproc_test_check_carveout_da_negative_delta(struct kunit *test)
> +{
> +       struct rproc rproc = { 0 };
> +       struct rproc_mem_entry mem = { 0 };
> +       int ret;
> +
> +       /* requested da (0x1000) lies before the carveout's da (0x2000) */
> +       mem.da = 0x2000;
> +       mem.len = 0x100;
> +
> +       ret = rproc_check_carveout_da(&rproc, &mem, 0x1000, 0x10);
> +       KUNIT_EXPECT_EQ(test, ret, -EINVAL);
> +}
> +
> +static void rproc_test_check_carveout_da_exceeds_end(struct kunit *test)
> +{
> +       struct rproc rproc = { 0 };
> +       struct rproc_mem_entry mem = { 0 };
> +       int ret;
> +
> +       /* delta (0x80) + len (0x100) = 0x180, one byte over mem->len (0x100) -> 0x180 > 0x100 */
> +       mem.da = 0x1000;
> +       mem.len = 0x100;
> +
> +       ret = rproc_check_carveout_da(&rproc, &mem, 0x1080, 0x100);
> +       KUNIT_EXPECT_EQ(test, ret, -EINVAL);
> +}
> +
> +static void rproc_test_check_carveout_da_exact_fit(struct kunit *test)
> +{
> +       struct rproc rproc = { 0 };
> +       struct rproc_mem_entry mem = { 0 };
> +       int ret;
> +
> +       /*
> +        * Boundary case: delta (0xf0) + len (0x10) == mem->len (0x100)
> +        * exactly. The check is "> mem->len", so this must pass -- this
> +        * is exactly the kind of edge an off-by-one would break.
> +        */
> +       mem.da = 0x1000;
> +       mem.len = 0x100;
> +
> +       ret = rproc_check_carveout_da(&rproc, &mem, 0x10f0, 0x10);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
> +static void rproc_test_check_carveout_da_any_skip_check(struct kunit *test)
> +{
> +       struct rproc rproc = { 0 };
> +       struct rproc_mem_entry mem = { 0 };
> +       int ret;
> +
> +       /*
> +        * da == FW_RSC_ADDR_ANY -> address check is skipped entirely,
> +        * only len is validated against mem->len.
> +        */
> +       mem.da = 0x1000;
> +       mem.len = 0x100;
> +
> +       ret = rproc_check_carveout_da(&rproc, &mem, FW_RSC_ADDR_ANY, 0x50);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
> +static struct kunit_case rproc_core_test_cases[] = {
> +       KUNIT_CASE(rproc_test_check_carveout_len_exceeds),
> +       KUNIT_CASE(rproc_test_check_carveout_da_any_mismatch),
> +       KUNIT_CASE(rproc_test_check_carveout_da_negative_delta),
> +       KUNIT_CASE(rproc_test_check_carveout_da_exceeds_end),
> +       KUNIT_CASE(rproc_test_check_carveout_da_exact_fit),
> +       KUNIT_CASE(rproc_test_check_carveout_da_any_skip_check),
> +       {}
> +};
> +
> +static struct kunit_suite rproc_core_test_suite = {
> +       .name = "remoteproc_core",
> +       .test_cases = rproc_core_test_cases,
> +};
> +
> +kunit_test_suite(rproc_core_test_suite);
> +
> +#endif /* _REMOTEPROC_CORE_KUNIT_H */
> --
> 2.34.1
>
