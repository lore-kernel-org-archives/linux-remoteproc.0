Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A634361DDF
	for <linux-remoteproc@vger.kernel.org>; Fri,  5 Dec 2025 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764948356; cv=none; b=h3iwmeDRz3CtUjaLxP0pwjWoA++XMfqiE6aOmWDG1sl+brgpFJt56QhLl71i+C5gsK2cJgQVIGZfVT44ZOEZQhD1VDoiCoZYwxc5xSzHMl7AbfNwgKILKBzNjRB4dcyimhhLzKfmhKdVIpeN0MbwGoeusopOewzy1y+eOPgGoKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764948356; c=relaxed/simple;
	bh=8B55ybRhaP1NxjzHhS5j+J3kMnpXtYwOq404qobc2fM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RnfkXBGXi5XlTsITwMSpM80kzx/utWAeCs6rY5ylz8bLgLJ3wNExCFv8qFyyXgOmzz6SSBVB3ABfcRmCqcIUCBwmyKuBTYXRJdh/mIzTddKdZAXIB3T2ctLvZlq7tAp0aiRBhRcZ+vtB1NtCRzQTlkAM2ssjeHbW4R+98SwqFyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vD5qHcI1; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vD5qHcI1"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so4294353a12.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 05 Dec 2025 07:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764948351; x=1765553151; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GsoIJVCHmWy1FT7O+N+z+bRw/e2lbo3jyE9iVhVEHoY=;
        b=vD5qHcI1ingruhgGMyNIMC255ukHM3NidyoDohriQrMaV9fm0TcW3v3LRwA7+wVaWq
         3HnShgblv+FpVJbwI+qKYRO+XJSnV7pOfQV5rd2ha+xEzoLUiOZqZy+qpR3KSxkckoed
         qV/9OFHDXimttHAOojI1D35QiiWbytKBwwgEJUMK/7kvzGaD71mjqU1/KfEH50nIdvZU
         Q/YlX1RS7OlhoafLr6Se/CvFO+58kCaiW2+xJetLZKvmWQcldKkMgnN8AMMHuVeM19f3
         58GVS/h53irqjZxwqmXy+nvhoOtoFiellRkfgw2g5vuSXngcRIt5KnaycRo4heK4xaan
         4VHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764948351; x=1765553151;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsoIJVCHmWy1FT7O+N+z+bRw/e2lbo3jyE9iVhVEHoY=;
        b=eBmHh6rFs55gjdDIc5jk1su3CfSeeFP29291ipBxtYgRE+pBBU+D9toAxtOkDsR4rn
         op0NmuTJ3xDjDe7jB5rEOPFIw6XG0vGIpRr/+1/NVmTfejrCYsPfbu8K0KXzr4cYNwli
         k1Irpl7kqnoPeWlRMKqLclH7yDxjpk3ZzFeJcvBcZUBIwk1VjJpXEFysOX9uDB/1tcuk
         JMEUoeXM9CT6b8YA7XbeBz+Z0dZpPNvu+AIFio5M+cb/TU0JTh3QlVjRsyHOR9MP47Wa
         4rG9weAnxt6ogyVEkE7xiZ8E2Q/IkENUGTZepswpgjCaPfnlj7LW9Lj/abxlPr/Hq5iD
         01wA==
X-Forwarded-Encrypted: i=1; AJvYcCX9oKds7DgtWlYpc9wAGvRgr2bqTVfzifN+8jkvKVswPp5yfzPrR0dDBJ94SZR/6fejwHOV3rhxb/EQGR9bt29C@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt97Zk0vb0FuUONNtYpo0w+qWB50pymcKQs4MdE56aVtOi1iGf
	e8v6ixpwOusRbAOz45RZvVxNPz51/MdwZTVk/ibg1hBRu9saVzJ2J1QjQcToDI1I9Yh8z5IvqaQ
	m8zOoG1V/RidDVXancDfVB3FQBpQbik/4WS5dimrxgA==
X-Gm-Gg: ASbGncsXJPSFV4cCrxFF7HzuRrQ2BTWYfmZXK63isfU04XCL4z1QG/O5f1DmFId+DFd
	ajqYmSg8OD1hR7/ViYuV0MYII749uWV3icv8CTKDSBPll5zWazdFoYLoG6Vf7NK6FwEpXAWnFzD
	2jQD6yO4obIkbzGgvmGoHEC596zamoZltuoUz7DFlaBm0HhitYuQu8SpKzZLmrNzkJw+oobqajh
	OQVuGwzvB0GYxuEpW9s8zaBf0+yzyIe7Y82h5TI6LmG+J3PI360cKWCwk5r1AQ4DmUE50IUHI2L
	Qb3DxqQMgCNWGNzPG8K/01bzgDPsYg==
X-Google-Smtp-Source: AGHT+IE1o/bitoxaz1MpajvIa9GlFCkS/N0ihp9NddOYMAK2pOvstDfHPLiItzKSf0xSdfRKtHCoH2qZMY6AamTfLAs=
X-Received: by 2002:a17:907:3cc8:b0:b71:88eb:e60c with SMTP id
 a640c23a62f3a-b79dc77df3emr949922266b.44.1764948351178; Fri, 05 Dec 2025
 07:25:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 5 Dec 2025 08:25:39 -0700
X-Gm-Features: AQt7F2rMfEJ0gvCUdSL0MMUPuM12OYKnm17iWsBqbS-CCk_tDkv2CDckLPP4-OA
Message-ID: <CANLsYkzhvZK4ZhNP=Zc0XxENxGV8efFEMGLBc3RAV626edysiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] docs: Update documentation to avoid mentioning of kernel.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, "Dr. David Alan Gilbert" <linux@treblig.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Joe Perches <joe@perches.com>, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 at 14:47, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> For several years, and still ongoing, the kernel.h is being split
> to smaller and narrow headers to avoid "including everything" approach
> which is bad in many ways. Since that, documentation missed a few
> required updates to align with that work. Do it here.
>
> Note, language translations are left untouched and if anybody willing
> to help, please provide path(es) based on the updated English variant.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> ---
>
> v2: collected tag (Randy), fixed util_macros k-doc (Randy, me), fixed spelling (Randy)
>
>  Documentation/core-api/kobject.rst              |  2 +-
>  Documentation/dev-tools/checkpatch.rst          |  2 +-
>  Documentation/driver-api/basics.rst             | 17 ++++++++++++++++-
>  .../driver-api/driver-model/design-patterns.rst |  2 +-
>  Documentation/process/coding-style.rst          | 10 +++++++---
>  Documentation/staging/rpmsg.rst                 |  7 +++++--
>  include/linux/util_macros.h                     |  2 +-
>  7 files changed, 32 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/core-api/kobject.rst b/Documentation/core-api/kobject.rst
> index 7310247310a0..5f6c61bc03bf 100644
> --- a/Documentation/core-api/kobject.rst
> +++ b/Documentation/core-api/kobject.rst
> @@ -78,7 +78,7 @@ just a matter of using the kobj member.  Code that works with kobjects will
>  often have the opposite problem, however: given a struct kobject pointer,
>  what is the pointer to the containing structure?  You must avoid tricks
>  (such as assuming that the kobject is at the beginning of the structure)
> -and, instead, use the container_of() macro, found in ``<linux/kernel.h>``::
> +and, instead, use the container_of() macro, found in ``<linux/container_of.h>``::
>
>      container_of(ptr, type, member)
>
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index fa2988dd4657..c1dff8e6bccb 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -753,7 +753,7 @@ Macros, Attributes and Symbols
>      sizeof(foo)/sizeof(foo[0]) for finding number of elements in an
>      array.
>
> -    The macro is defined in include/linux/kernel.h::
> +    The macro is defined in include/linux/array_size.h::
>
>        #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
>
> diff --git a/Documentation/driver-api/basics.rst b/Documentation/driver-api/basics.rst
> index 5e9f7aee71a7..8b6a5888cb11 100644
> --- a/Documentation/driver-api/basics.rst
> +++ b/Documentation/driver-api/basics.rst
> @@ -114,10 +114,25 @@ Kernel objects manipulation
>  Kernel utility functions
>  ------------------------
>
> -.. kernel-doc:: include/linux/kernel.h
> +.. kernel-doc:: include/linux/array_size.h
> +   :internal:
> +
> +.. kernel-doc:: include/linux/container_of.h
> +   :internal:
> +
> +.. kernel-doc:: include/linux/kstrtox.h
>     :internal:
>     :no-identifiers: kstrtol kstrtoul
>
> +.. kernel-doc:: include/linux/stddef.h
> +   :internal:
> +
> +.. kernel-doc:: include/linux/util_macros.h
> +   :internal:
> +
> +.. kernel-doc:: include/linux/wordpart.h
> +   :internal:
> +
>  .. kernel-doc:: kernel/printk/printk.c
>     :export:
>     :no-identifiers: printk
> diff --git a/Documentation/driver-api/driver-model/design-patterns.rst b/Documentation/driver-api/driver-model/design-patterns.rst
> index 41eb8f41f7dd..965b2b93be6f 100644
> --- a/Documentation/driver-api/driver-model/design-patterns.rst
> +++ b/Documentation/driver-api/driver-model/design-patterns.rst
> @@ -103,7 +103,7 @@ The design pattern is the same for an hrtimer or something similar that will
>  return a single argument which is a pointer to a struct member in the
>  callback.
>
> -container_of() is a macro defined in <linux/kernel.h>
> +container_of() is a macro defined in <linux/container_of.h>
>
>  What container_of() does is to obtain a pointer to the containing struct from
>  a pointer to a member by a simple subtraction using the offsetof() macro from
> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index 2969ca378dbb..258158637f65 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -1070,7 +1070,7 @@ readability.
>  18) Don't re-invent the kernel macros
>  -------------------------------------
>
> -The header file include/linux/kernel.h contains a number of macros that
> +There are many header files in include/linux/ that contain a number of macros that
>  you should use, rather than explicitly coding some variant of them yourself.
>  For example, if you need to calculate the length of an array, take advantage
>  of the macro
> @@ -1079,14 +1079,18 @@ of the macro
>
>         #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
>
> +which is defined in array_size.h.
> +
>  Similarly, if you need to calculate the size of some structure member, use
>
>  .. code-block:: c
>
>         #define sizeof_field(t, f) (sizeof(((t*)0)->f))
>
> -There are also min() and max() macros that do strict type checking if you
> -need them.  Feel free to peruse that header file to see what else is already
> +which is defined in stddef.h.
> +
> +There are also min() and max() macros defined in minmax.h that do strict type checking
> +if you need them. Feel free to peruse the header files to see what else is already
>  defined that you shouldn't reproduce in your code.
>
>
> diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
> index 40282cca86ca..42bac1149d9d 100644
> --- a/Documentation/staging/rpmsg.rst
> +++ b/Documentation/staging/rpmsg.rst
> @@ -224,9 +224,12 @@ content to the console.
>
>  ::
>
> -  #include <linux/kernel.h>
> +  #include <linux/dev_printk.h>
> +  #include <linux/mod_devicetable.h>
>    #include <linux/module.h>
> +  #include <linux/printk.h>
>    #include <linux/rpmsg.h>
> +  #include <linux/types.h>
>
>    static void rpmsg_sample_cb(struct rpmsg_channel *rpdev, void *data, int len,
>                                                 void *priv, u32 src)
> @@ -244,7 +247,7 @@ content to the console.
>         /* send a message on our channel */
>         err = rpmsg_send(rpdev->ept, "hello!", 6);
>         if (err) {
> -               pr_err("rpmsg_send failed: %d\n", err);
> +               dev_err(&rpdev->dev, "rpmsg_send failed: %d\n", err);
>                 return err;
>         }

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>
> diff --git a/include/linux/util_macros.h b/include/linux/util_macros.h
> index 2eb528058d0d..71564868b8f6 100644
> --- a/include/linux/util_macros.h
> +++ b/include/linux/util_macros.h
> @@ -119,7 +119,7 @@
>   * a fuss about it. This makes the programmer responsible for tagging
>   * the functions that can be garbage-collected.
>   *
> - * With the macro it is possible to write the following:
> + * With the macro it is possible to write the following::
>   *
>   *     static int foo_suspend(struct device *dev)
>   *     {
> --
> 2.50.1
>
