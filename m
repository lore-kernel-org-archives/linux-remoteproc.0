Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A3A35DA69
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 15:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350129; cv=none; b=RxzBBlDk/cHTWgGU+9/aan5FCEhBrN++CSwpEiJPbkwGAv6t0l/OKpzHZ/5QBfLNJSUm7bJ2W4S0jl/yzBXx8B26IaReXLlhNOrSAT4Mpyv5Q1re37uRIWzzCSFeXVr04jQzwb9L6xTc75KpX/WKKIEC7J0NF+tDUcMJ1lJa6eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350129; c=relaxed/simple;
	bh=tNhM83MW869UyZbFMwt9N+SGNcCPL2XMXZ9CYCfgABo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e7AcmAReg9jOvP2c4KRMqRDt0HB11WrWkwTPjnuf79mw1LL5G7OB59358NaMC+OZZ3f+OVN+yYTC9Qv8PiVXWM5KAu0FUd4Kixhm+wX/ihOpiASW8tKNcSfnW8WLlp7U2/phS0sX58fDOK0RCO+PCvvDah8YuiPyD923xTVu/QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OP3iD7dw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OP3iD7dw"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso1942722f8f.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 08:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783350126; x=1783954926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xs8j4brUXr0ypdcLDB2fLZRqZ8cV0a8ndTlFArGMXY0=;
        b=OP3iD7dws8FvY7Ub0dqEacNeDiIa1RCpnOu6lHLNKP0BO3j3nxDZfaDYqD0JW00S9E
         N1/D7ankZwIRfHPeltsgHQ2NsorV91hb4AHyJB/E6EgmNA4vArV59d4toA7LnBqKQrz8
         dCS9VbjChFMPLyiwhHPBAE6UxsBsuNQDYJ7WzzqQr3xZcXsqpT+gQOyBXdk2YtVLmL9H
         I/ZxWgejNhlodw5CncopJO+U05hIohcf8CMIeGpWnLgfCEigA/ginJtIRkxEO7WFu4Ej
         1lXdwvna4fbN0CWB2EUwZP960RBeB6w0QAwil7QJ0FnhVzqux0REj/E8JI56Vfuu0SI8
         lDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350126; x=1783954926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xs8j4brUXr0ypdcLDB2fLZRqZ8cV0a8ndTlFArGMXY0=;
        b=Ocd+vaDKzu3IzNGVw1HmqHVg0Md82EgbRz1bsgJi3s7pec1UQxB/Tsz2Qky016RQp1
         S1cq0Nue2dx7S/DSRi/Kpl+ybEZZm21AHaUUAihqQz3PPSG1/IGjNsTxXaeLp4wyWrDu
         SRR0lmUk9Sq5xpnC3meUM1EolK3aEuOsbdL8taIvTIbcM7PWMFJTEFpwAyboxlVbkOcB
         /Ig3Ee6BLnsMZykl3OgGANzBg3FiTuHhdMvFvFVpIX7Kru4V+vKHHyLTH8sYXIvR9DyH
         apgNxO25Wn0IUqTnEZMhdo8DS5VdbH8YeBhrNgW2nJ+GTe128ILSVz73PRDU3lrLwDkc
         a8eA==
X-Forwarded-Encrypted: i=1; AHgh+Rql0CUCJ2Xb6Jh9JvjAZdHtnwpvJhEEDJuUDNMwbPK02lpgr2mgsRpMvbRcocJogT71AQQLKQ+zXlvwBdSWcxNu@vger.kernel.org
X-Gm-Message-State: AOJu0YxSiKJ5sh1E9Q0/696S00oCJ5C0N+jAqqY9EjY0EEfzoQMd5OLq
	yQz4ISkQCmDxgxqvPqKERQjGw1KgqToWP+DmNaLhzeDoVAGiQcCj5uesXGIxd37GLrk=
X-Gm-Gg: AfdE7cnzIeqbelQRnl5Z/XwDay4WQqNeb6caBzKbJurD21+b7YvIIujz7HCnNmwdvHM
	Ai9bsa+0B+UtQ1HKykeqPcBfIziO1XvIhYQR607o8arlb15LGHKI7wa/qx2O5b+gifLXoaPYuI6
	D5RPs7tK6IH8id+HMBPEgbVhDJFrW2U8uUcsXloMmfkt5HIDWSHHlJ00i6wO49cOQxTPE2P0pzW
	1MiPmLeW9c43KujClbUGouHGbpLwUEkAY7f+w5IgLDAiDgYthQNmFoJmlmg1lIi15SS8aMr8hQ/
	1Gpcz2q7ZEIcOKI3Vg/m6hC14hc1Z3k+2hQVJCDuLLin0t49oqyUJqsLqun/swOn32MKqY4kd5e
	6YBvr3e/UYUmGpdO59Tx80SJs8x63GHXBN64EIYJLP1CwNddDnsXwlx1cGtKrlWj+szWpNFeEll
	keV1z8JxOphh4rm12HoKfA6fjoPfUzW8xxKxdL3P1ORHeAn+1hWFEE6sWciDjt2Q6Vs8YYAdMAx
	pc=
X-Received: by 2002:a05:6000:11cd:b0:470:13e1:9904 with SMTP id ffacd0b85a97d-47de6697a34mr610940f8f.14.1783350125283;
        Mon, 06 Jul 2026 08:02:05 -0700 (PDT)
Received: from localhost (p200300f65f47db0404eb41111570ffdc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4eb:4111:1570:ffdc])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9e3e2702sm25607522f8f.9.2026.07.06.08.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:03 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v2] Documentation: Update after split of <linux/mod_devicetable.h>
Date: Mon,  6 Jul 2026 17:01:56 +0200
Message-ID:  <ede7ce64f20e10660ebf6bc1b41836dad750ae3b.1783349758.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6559; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=tNhM83MW869UyZbFMwt9N+SGNcCPL2XMXZ9CYCfgABo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqS8NkLKZTxTI5VhFzt6/qVn08gWVdil3p7byv+ PWxasXkmlyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakvDZAAKCRCPgPtYfRL+ TqUyCACo1has6TDU4nAmEcSDQyOyqK0+sz60rnW3hDs1qiHcCdHarKhBkh1TBpVtMsjKiwqyMq1 0OcEB31QIlYlzkbrGio0BrsqjXOfltCB9bVCUyGmzE/UIRR05+20uFQ3qiAPade+uAKdl5UxNFN hEfZcrhlvjxbn829wM1SIjUtgFI5iCG2az5fWGXMhWPnEGlj7k0qon//qGgAjVSGnVq07x5zXEX rTNVMsYL9fCxrxhtv/tnOVHDTNKYriCQ25yH7e7vBmCAZ2KDeAKH1pbtIjDtgg0wCg1QpfcmgTs NaCUymdX5tMpf5S2q2K4jpzGFT/76+n4xBdzeL6JVU0Zf6jH
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Most structs that were defined in <linux/mod_devicetable.h> before were
moved to a bus specific header. Follow the movement to get the struct's
documenation back.

For the list of device ids in basic.rst use an explict list of all the
headers that have kernel-doc annotations and that are not described
elsewhere (i.e. pci and mei_cl).

Also repair the referencing in the zh_CN translation of pci.rst and
don't duplicate `struct mei_cl_device_id`.

Fixes: ad428f5811bd ("mod_devicetable.h: Split into per subsystem headers")
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

the explicit list is a bit ugly, but I don't have a better idea.

If you're happy with the patch, can Linus and Jonathan please agree on how this
is applied?

Best regards
Uwe

 Documentation/PCI/pci.rst                     |  2 +-
 Documentation/driver-api/basics.rst           | 31 +++++++++++++++++--
 .../driver-api/mei/mei-client-bus.rst         | 12 ++-----
 Documentation/pcmcia/driver.rst               |  2 +-
 Documentation/staging/rpmsg.rst               |  2 +-
 Documentation/translations/zh_CN/PCI/pci.rst  |  8 ++---
 6 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/Documentation/PCI/pci.rst b/Documentation/PCI/pci.rst
index be35e9a1ee75..71c42b0bfa8b 100644
--- a/Documentation/PCI/pci.rst
+++ b/Documentation/PCI/pci.rst
@@ -84,7 +84,7 @@ initialization with a pointer to a structure describing the driver
 The ID table is an array of ``struct pci_device_id`` entries ending with an
 all-zero entry.  Definitions with static const are generally preferred.
 
-.. kernel-doc:: include/linux/mod_devicetable.h
+.. kernel-doc:: include/linux/device-id/pci.h
    :functions: pci_device_id
 
 Most drivers only need ``PCI_DEVICE()`` or ``PCI_DEVICE_CLASS()`` to set up
diff --git a/Documentation/driver-api/basics.rst b/Documentation/driver-api/basics.rst
index 8b6a5888cb11..647e14254cfb 100644
--- a/Documentation/driver-api/basics.rst
+++ b/Documentation/driver-api/basics.rst
@@ -10,9 +10,36 @@ Driver Entry and Exit points
 Driver device table
 -------------------
 
-.. kernel-doc:: include/linux/mod_devicetable.h
+.. kernel-doc:: include/linux/device-id/amba.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/cdx.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/coreboot.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/dfl.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/fsl_mc.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/ishtp.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/mdio.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/mhi.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/mips_cdmm.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/rio.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/tb.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/tee_client.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/typec.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/usb.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/wmi.h
    :internal:
-   :no-identifiers: pci_device_id
 
 
 Delaying and scheduling routines
diff --git a/Documentation/driver-api/mei/mei-client-bus.rst b/Documentation/driver-api/mei/mei-client-bus.rst
index f242b3f8d6aa..d46c0d0b3540 100644
--- a/Documentation/driver-api/mei/mei-client-bus.rst
+++ b/Documentation/driver-api/mei/mei-client-bus.rst
@@ -41,17 +41,11 @@ the ``struct mei_cl_driver`` structure defined in :file:`include/linux/mei_cl_bu
 
 
 
-The mei_cl_device_id structure defined in :file:`include/linux/mod_devicetable.h` allows a
+The mei_cl_device_id structure defined in :file:`include/linux/device-id/mei_cl.h` allows a
 driver to bind itself against a device name.
 
-.. code-block:: C
-
-        struct mei_cl_device_id {
-                char name[MEI_CL_NAME_SIZE];
-                uuid_le uuid;
-                __u8    version;
-                kernel_ulong_t driver_info;
-        };
+.. kernel-doc:: include/linux/device-id/mei_cl.h
+   :functions: mei_cl_device_id
 
 To actually register a driver on the ME Client bus one must call the :c:func:`mei_cl_add_driver`
 API. This is typically called at module initialization time.
diff --git a/Documentation/pcmcia/driver.rst b/Documentation/pcmcia/driver.rst
index 5c4fe84d51c1..b91e5c14cb87 100644
--- a/Documentation/pcmcia/driver.rst
+++ b/Documentation/pcmcia/driver.rst
@@ -15,7 +15,7 @@ runtime as shown below::
 All fields are passed in as hexadecimal values (no leading 0x).
 The meaning is described in the PCMCIA specification, the match_flags is
 a bitwise or-ed combination from PCMCIA_DEV_ID_MATCH_* constants
-defined in include/linux/mod_devicetable.h.
+defined in include/linux/device-id/pcmcia.h.
 
 Once added, the driver probe routine will be invoked for any unclaimed
 PCMCIA device listed in its (newly updated) pcmcia_device_id list.
diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
index 42bac1149d9d..c3a8042e8343 100644
--- a/Documentation/staging/rpmsg.rst
+++ b/Documentation/staging/rpmsg.rst
@@ -225,7 +225,7 @@ content to the console.
 ::
 
   #include <linux/dev_printk.h>
-  #include <linux/mod_devicetable.h>
+  #include <linux/device-id/rpmsg.h>
   #include <linux/module.h>
   #include <linux/printk.h>
   #include <linux/rpmsg.h>
diff --git a/Documentation/translations/zh_CN/PCI/pci.rst b/Documentation/translations/zh_CN/PCI/pci.rst
index 347f5c3f5ce9..64372a16caf6 100644
--- a/Documentation/translations/zh_CN/PCI/pci.rst
+++ b/Documentation/translations/zh_CN/PCI/pci.rst
@@ -84,16 +84,16 @@ PCI设备驱动程序在初始化过程中调用 ``pci_register_driver()`` ，
 
 该API在以下内核代码中:
 
-include/linux/pci.h
-pci_driver
+.. kernel-doc:: include/linux/pci.h
+   :functions: pci_driver
 
 ID表是一个由 ``struct pci_device_id`` 结构体成员组成的数组，以一个全零的成员
 结束。一般来说，带有静态常数的定义是首选。
 
 该API在以下内核代码中:
 
-include/linux/mod_devicetable.h
-pci_device_id
+.. kernel-doc:: include/linux/device-id/pci.h
+   :functions: pci_device_id
 
 大多数驱动程序只需要 ``PCI_DEVICE()`` 或 ``PCI_DEVICE_CLASS()`` 来设置一个
 pci_device_id表。

base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
-- 
2.55.0.11.g153666a7d9bb

