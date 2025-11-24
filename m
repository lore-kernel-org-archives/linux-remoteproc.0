Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA97B2652B7
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 03:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763953364; cv=none; b=lKCtZ7d4LpxI4RRztsaozPPS1QlpD6FCv1yKctwNoK5ysAE/Lh5uW+93DAvJNwy6ZRE2tag7MAm0Zlg7KfduCSpNHjh9NnNl8XxXRsqucXZsUg/TWgRUJvWvqi+9nOf01eASJYnPeZwoSHk+vxiRBGIiX9FAvXoyO1ps6FtYjJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763953364; c=relaxed/simple;
	bh=7lglDPhhscPmEKRf/7UQETmGZN6t/kqZ2e38UElfHN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYh4GJ2xvcFd+/M3RfEYvJrO4mAfe4Et1HJ69PV7foC5GtiMsyrY4x3RhhQbnC5Z+jZNGiTSpH1wjs6ZJ5spGsej2KWu7gGPr1cUaH6bma+jTu9kRLzQxEaTehQ1aSdZo+dnXnogojlnjcvkl5POw6S8FR1fx1WsGAuoVFhXnF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVAmXbmS; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVAmXbmS"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34361025290so3005403a91.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 23 Nov 2025 19:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763953362; x=1764558162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EThjVRtG3u91ThHtH8s7htB0Qt2hP8NHKg4Z/0u1oC4=;
        b=MVAmXbmSW7Fd6KYzUTcIcWzZIVBJDYo7LcDY3hPwDsNA0jeRa+S4ogElHg98etyUQy
         DPaufFik0PtlgjYMzycv2zaC1sNE1D4UWqg1MSMRPUrn92U58bXfghSsJajMIekGueB8
         Z5tscZHPLrglDGRpzuU8SXKOOCuS9ogOCzyvaxZqqSrdCBKNiKqKFeopFU0RNrOgCbYZ
         yTAkLLyTPofxrBkxqkLYGw0zoeic4R4gowdMXbpwcncKRGe/oWbbnK53xcm74YsEoxvs
         uBCbj9ZMB3wAtFYl6evnzwEXcDp3P7IqKpl77522z+75VX/z31Uat2H6O7gJu0z49AKk
         5tGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763953362; x=1764558162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EThjVRtG3u91ThHtH8s7htB0Qt2hP8NHKg4Z/0u1oC4=;
        b=cnTwe+kI9pURfEQaXcbWGlMZ+rOlnAZlfklKnabKFuR5DMJbMLIK48tQ//Nw0GPClw
         2uilUtpdr/dtz/k+klS9llm5wtj5H6lbCY4GF1UoTiHja/oErvnWAi9nbU8xnLV9y3Cb
         2gNnACKrEhJANFSss1gmgd/fGndF/adUAIbNRXhHcR2Na+kMalps8X8RWngwBifWCHH/
         UeoKvv15XPFMJzWWeR1OHAAT8yoLN5Q0xM4aMklLdMAjwu4ImgRZUx7DsLXBNINLM47g
         EWtQfEgkfkX+xTbwtYDL1NI21hWRefC1ZngdtAiaxC+BMzRQr60cyD8F89ARCdt15Dmk
         6rvg==
X-Forwarded-Encrypted: i=1; AJvYcCXTzYzXOfEBNrTMDQuuMfit9VNMdjjsjqyi1dWkfu7l2/8zrTLdlpEd1tm0UAPLPOfdHX8ypeHhCez2NN+Pvs1+@vger.kernel.org
X-Gm-Message-State: AOJu0YxsurG/5F1zHDUp0+9mqn2lmhqZK0t0Dra172G+czGiww6EhoNl
	EXcYrylQU1pSe0xl3Zh+4EktRwpEe/i5tJG8uQ+RncZz/GURlWOVIGVQ
X-Gm-Gg: ASbGncuPHfkjrLeLWUo5H/EpHPqQCbmmuhFA1eao8+wRGKLJrPddpXZ5HEzHVrYom1S
	2UyLX8lol/X3H4TQjflFpp8RFoLgCGOQv4vXVe6E3+/rnYVyQmCkw/IAn5ScfTRizNOOZ8LUp7s
	CVKpMyaGfLf7V6JNm/imlTEj2uXFMeqgE5Vum5raqmzcPFpVj1PZ/saDGhhQDK+4QI+UzM6vlM5
	Aw3sOR7Rdm5Kfjgpu2rJFKXLQPaNhBANyOqhojZ9DGJg8AC82CDV3UiLBKOrvqnD+lyQgo5cGGb
	MHi6yB4TpTU2KCq9hQJXW6CIJzxfmqiQrzyjimLHPjzPzE6sz5dssGMQewyI277SA2kThAeGHg8
	jy7mccS+xQBNGxP1Oswy/t1LS4w6Ee3grkavVkjrKoIzKZzrHnOFBq3qUke23+ZzCDr5V3NYMnl
	t9u4m7ztmKYj4=
X-Google-Smtp-Source: AGHT+IEMt538xCkv+fqIIYil9IQfkAkpZOfttXOCrxqxU9ijd4Z/n1H3Gpy/X0jI7VxwtTCqcmNbzA==
X-Received: by 2002:a17:90b:35cc:b0:341:194:5e7d with SMTP id 98e67ed59e1d1-34733f19c00mr11223472a91.24.1763953361678;
        Sun, 23 Nov 2025 19:02:41 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5178esm11869866a91.16.2025.11.23.19.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 19:02:40 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 8D1794209E72; Mon, 24 Nov 2025 10:02:37 +0700 (WIB)
Date: Mon, 24 Nov 2025 10:02:37 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	tglx@linutronix.de, andersson@kernel.org, pmladek@suse.com,
	rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, jonechou@google.com,
	rostedt@goodmis.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
Subject: Re: [PATCH 01/26] kernel: Introduce meminspect
Message-ID: <aSPKzcsFixn48edg@archie.me>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-2-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jjzv1iO7GRx9l9vd"
Content-Disposition: inline
In-Reply-To: <20251119154427.1033475-2-eugen.hristev@linaro.org>


--jjzv1iO7GRx9l9vd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 05:44:02PM +0200, Eugen Hristev wrote:
> diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/=
index.rst
> index 4b8425e348ab..8ce605de8ee6 100644
> --- a/Documentation/dev-tools/index.rst
> +++ b/Documentation/dev-tools/index.rst
> @@ -38,6 +38,7 @@ Documentation/process/debugging/index.rst
>     gpio-sloppy-logic-analyzer
>     autofdo
>     propeller
> +   meminspect
> =20
> =20
>  .. only::  subproject and html
> diff --git a/Documentation/dev-tools/meminspect.rst b/Documentation/dev-t=
ools/meminspect.rst
> new file mode 100644
> index 000000000000..2a0bd4d6e448
> --- /dev/null
> +++ b/Documentation/dev-tools/meminspect.rst
> @@ -0,0 +1,139 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +meminspect
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This document provides information about the meminspect feature.
> +
> +Overview
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +meminspect is a mechanism that allows the kernel to register a chunk of
> +memory into a table, to be used at a later time for a specific
> +inspection purpose like debugging, memory dumping or statistics.
> +
> +meminspect allows drivers to traverse the inspection table on demand,
> +or to register a notifier to be called whenever a new entry is being add=
ed
> +or removed.
> +
> +The reasoning for meminspect is also to minimize the required information
> +in case of a kernel problem. For example a traditional debug method invo=
lves
> +dumping the whole kernel memory and then inspecting it. Meminspect allow=
s the
> +users to select which memory is of interest, in order to help this speci=
fic
> +use case in production, where memory and connectivity are limited.
> +
> +Although the kernel has multiple internal mechanisms, meminspect fits
> +a particular model which is not covered by the others.
> +
> +meminspect Internals
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +API
> +---
> +
> +Static memory can be registered at compile time, by instructing the comp=
iler
> +to create a separate section with annotation info.
> +For each such annotated memory (variables usually), a dedicated struct
> +is being created with the required information.
> +To achieve this goal, some basic APIs are available:
> +
> +  MEMINSPECT_ENTRY(idx, sym, sz)
> +is the basic macro that takes an ID, the symbol, and a size.
> +
> +To make it easier, some wrappers are also defined:
> +  MEMINSPECT_SIMPLE_ENTRY(sym)
> +will use the dedicated MEMINSPECT_ID_##sym with a size equal to sizeof(s=
ym)
> +
> +  MEMINSPECT_NAMED_ENTRY(name, sym)
> +will be a simple entry that has an id that cannot be derived from the sy=
m,
> +so a name has to be provided
> +
> +  MEMINSPECT_AREA_ENTRY(sym, sz)
> +this will register sym, but with the size given as sz, useful for e.g.
> +arrays which do not have a fixed size at compile time.
> +
> +For dynamically allocated memory, or for other cases, the following APIs
> +are being defined:
> +  meminspect_register_id_pa(enum meminspect_uid id, phys_addr_t zone,
> +                            size_t size, unsigned int type);
> +which takes the ID and the physical address.
> +Similarly there are variations:
> +  meminspect_register_pa() omits the ID
> +  meminspect_register_id_va() requires the ID but takes a virtual address
> +  meminspect_register_va() omits the ID and requires a virtual address
> +
> +If the ID is not given, the next avialable dynamic ID is allocated.
> +
> +To unregister a dynamic entry, some APIs are being defined:
> +  meminspect_unregister_pa(phys_addr_t zone, size_t size);
> +  meminspect_unregister_id(enum meminspect_uid id);
> +  meminspect_unregister_va(va, size);
> +
> +All of the above have a lock variant that ensures the lock on the table
> +is taken.
> +
> +
> +meminspect drivers
> +------------------
> +
> +Drivers are free to traverse the table by using a dedicated function
> +meminspect_traverse(void *priv, MEMINSPECT_ITERATOR_CB cb)
> +The callback will be called for each entry in the table.
> +
> +Drivers can also register a notifier with
> +  meminspect_notifier_register()
> +and unregister with
> +  meminspect_notifier_unregister()
> +to be called when a new entry is being added or removed.
> +
> +Data structures
> +---------------
> +
> +The regions are being stored in a simple fixed size array. It avoids
> +memory allocation overhead. This is not performance critical nor does
> +allocating a few hundred entries create a memory consumption problem.
> +
> +The static variables registered into meminspect are being annotated into
> +a dedicated .inspect_table memory section. This is then walked by memins=
pect
> +at a later time and each variable is then copied to the whole inspect ta=
ble.
> +
> +meminspect Initialization
> +-------------------------
> +
> +At any time, meminspect will be ready to accept region registration
> +from any part of the kernel. The table does not require any initializati=
on.
> +In case CONFIG_CRASH_DUMP is enabled, meminspect will create an ELF head=
er
> +corresponding to a core dump image, in which each region is added as a
> +program header. In this scenario, the first region is this ELF header, a=
nd
> +the second region is the vmcoreinfo ELF note.
> +By using this mechanism, all the meminspect table, if dumped, can be
> +concatenated to obtain a core image that is loadable with the `crash` to=
ol.
> +
> +meminspect example
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A simple scenario for meminspect is the following:
> +The kernel registers the linux_banner variable into meminspect with
> +a simple annotation like:
> +
> +  MEMINSPECT_SIMPLE_ENTRY(linux_banner);
> +
> +The meminspect late initcall will parse the compilation time created tab=
le
> +and copy the entry information into the inspection table.
> +At a later point, any interested driver can call the traverse function to
> +find out all entries in the table.
> +A specific driver will then note into a specific table the address of the
> +banner and the size of it.
> +The specific table is then written to a shared memory area that can be
> +read by upper level firmware.
> +When the kernel freezes (hypothetically), the kernel will no longer feed
> +the watchdog. The watchdog will trigger a higher exception level interru=
pt
> +which will be handled by the upper level firmware. This firmware will th=
en
> +read the shared memory table and find an entry with the start and size of
> +the banner. It will then copy it for debugging purpose. The upper level
> +firmware will then be able to provide useful debugging information,
> +like in this example, the banner.
> +
> +As seen here, meminspect facilitates the interaction between the kernel
> +and a specific firmware.

Sphinx reports htmldocs warnings:

Documentation/dev-tools/meminspect.rst:42: WARNING: Block quote ends withou=
t a blank line; unexpected unindent. [docutils]
Documentation/dev-tools/meminspect.rst:46: WARNING: Definition list ends wi=
thout a blank line; unexpected unindent. [docutils]
Documentation/dev-tools/meminspect.rst:49: WARNING: Block quote ends withou=
t a blank line; unexpected unindent. [docutils]
Documentation/dev-tools/meminspect.rst:53: WARNING: Block quote ends withou=
t a blank line; unexpected unindent. [docutils]
Documentation/dev-tools/meminspect.rst:58: ERROR: Unexpected indentation. [=
docutils]
Documentation/dev-tools/meminspect.rst:60: WARNING: Block quote ends withou=
t a blank line; unexpected unindent. [docutils]
Documentation/dev-tools/meminspect.rst:62: ERROR: Unexpected indentation. [=
docutils]
Documentation/dev-tools/meminspect.rst:80: WARNING: Inline emphasis start-s=
tring without end-string. [docutils]
Documentation/dev-tools/meminspect.rst:88: WARNING: Definition list ends wi=
thout a blank line; unexpected unindent. [docutils]

I have to fix them up:

---- >8 ----
diff --git a/Documentation/dev-tools/meminspect.rst b/Documentation/dev-too=
ls/meminspect.rst
index 2a0bd4d6e4481e..d6a221b1169f04 100644
--- a/Documentation/dev-tools/meminspect.rst
+++ b/Documentation/dev-tools/meminspect.rst
@@ -38,37 +38,43 @@ For each such annotated memory (variables usually), a d=
edicated struct
 is being created with the required information.
 To achieve this goal, some basic APIs are available:
=20
-  MEMINSPECT_ENTRY(idx, sym, sz)
-is the basic macro that takes an ID, the symbol, and a size.
+  * MEMINSPECT_ENTRY(idx, sym, sz)
+    is the basic macro that takes an ID, the symbol, and a size.
=20
 To make it easier, some wrappers are also defined:
-  MEMINSPECT_SIMPLE_ENTRY(sym)
-will use the dedicated MEMINSPECT_ID_##sym with a size equal to sizeof(sym)
=20
-  MEMINSPECT_NAMED_ENTRY(name, sym)
-will be a simple entry that has an id that cannot be derived from the sym,
-so a name has to be provided
+  * MEMINSPECT_SIMPLE_ENTRY(sym)
+    will use the dedicated MEMINSPECT_ID_##sym with a size equal to sizeof=
(sym)
=20
-  MEMINSPECT_AREA_ENTRY(sym, sz)
-this will register sym, but with the size given as sz, useful for e.g.
-arrays which do not have a fixed size at compile time.
+  * MEMINSPECT_NAMED_ENTRY(name, sym)
+    will be a simple entry that has an id that cannot be derived from the =
sym,
+    so a name has to be provided
+
+  * MEMINSPECT_AREA_ENTRY(sym, sz)
+    this will register sym, but with the size given as sz, useful for e.g.
+    arrays which do not have a fixed size at compile time.
=20
 For dynamically allocated memory, or for other cases, the following APIs
-are being defined:
+are being defined::
+
   meminspect_register_id_pa(enum meminspect_uid id, phys_addr_t zone,
                             size_t size, unsigned int type);
+
 which takes the ID and the physical address.
+
 Similarly there are variations:
-  meminspect_register_pa() omits the ID
-  meminspect_register_id_va() requires the ID but takes a virtual address
-  meminspect_register_va() omits the ID and requires a virtual address
+
+  * meminspect_register_pa() omits the ID
+  * meminspect_register_id_va() requires the ID but takes a virtual address
+  * meminspect_register_va() omits the ID and requires a virtual address
=20
 If the ID is not given, the next avialable dynamic ID is allocated.
=20
 To unregister a dynamic entry, some APIs are being defined:
-  meminspect_unregister_pa(phys_addr_t zone, size_t size);
-  meminspect_unregister_id(enum meminspect_uid id);
-  meminspect_unregister_va(va, size);
+
+  * meminspect_unregister_pa(phys_addr_t zone, size_t size);
+  * meminspect_unregister_id(enum meminspect_uid id);
+  * meminspect_unregister_va(va, size);
=20
 All of the above have a lock variant that ensures the lock on the table
 is taken.
@@ -77,15 +83,15 @@ is taken.
 meminspect drivers
 ------------------
=20
-Drivers are free to traverse the table by using a dedicated function
-meminspect_traverse(void *priv, MEMINSPECT_ITERATOR_CB cb)
+Drivers are free to traverse the table by using a dedicated function::
+
+  meminspect_traverse(void *priv, MEMINSPECT_ITERATOR_CB cb)
+
 The callback will be called for each entry in the table.
=20
-Drivers can also register a notifier with
-  meminspect_notifier_register()
-and unregister with
-  meminspect_notifier_unregister()
-to be called when a new entry is being added or removed.
+Drivers can also register a notifier with meminspect_notifier_register()
+and unregister with meminspect_notifier_unregister() to be called when a n=
ew
+entry is being added or removed.
=20
 Data structures
 ---------------
@@ -115,7 +121,7 @@ meminspect example
=20
 A simple scenario for meminspect is the following:
 The kernel registers the linux_banner variable into meminspect with
-a simple annotation like:
+a simple annotation like::
=20
   MEMINSPECT_SIMPLE_ENTRY(linux_banner);
=20

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--jjzv1iO7GRx9l9vd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaSPKyAAKCRD2uYlJVVFO
o3X1AQDv/TE1tWTJ8ZXxzegUA8QbZl8nMDxfkacY7FNjZC/xRQD8DSFK9tPqxhS0
Zf7jek/k/PHFmMUwkhTyDVy+lTogUgc=
=cIN1
-----END PGP SIGNATURE-----

--jjzv1iO7GRx9l9vd--
