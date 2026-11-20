Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173097;
	b=TdhqTcRYdFI/mfI3w0VYsF6P6zpEtHJwr+0Szhfv6EkYNOpLXdJ1r7d6winLrmYdyybj
	 PdW/D88IFS/r1BcZoDk3fTZP/1EKsAOr/M9F8Qk3vS8qti/hqLNk3/2NCLdh+ROynVOTV
	 LYph9/Gc3v7n71v8WskXqwvvtw+XFS6nGtKaUquuzRhu0uNmmPnb27aE4Ir84wjlopDOl
	 8N0tYyZTCc2gJO3M5pPWI4ka8Zqn5lV0LjviV4BaRx1NqMpk7unKJHw4KcDOPBNLsuWSt
	 9GpyuOvndQxyhSdZ9yf/CqlKojA8UmebOVuv0uP53+Tel+WbMzkidQJGijL88qt/yzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=6iowvnjr0RIgWlIDQQOFrlHY5uCtXtYYlYEEp/cOH20=;
	b=wGb6x+DyKeysvh+3gKQ5EYez+Vqp8ftzTEzAVYRMMVE3ckafTZxYH5QlBgOdV6O0gVdv
	 9uBzB4Am9PWmoMnYOOjo0IgxTBt+dILENTcZ2V6A5YTDTsdhOiSL6yVF13mV+/gmiunOY
	 OUN2APzSpARae0z4u/J90ei7xzFoZvUbjwXzN7k0b/eT03XIyr7Fu1Y6i1YCi+JrBV+nT
	 sC0CcQKMXZT/T54523sr4dHNDNxKHoYC3pd8rMDqeFd0/IgsBWBI2YqR/KHoHV6+u1Zhr
	 XBKwifkAUZfggSMiXS8UciCD0DoyU4CaB+Hv/L9l5PpGBgCXZ0sJpAp02MOFB+nb3tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cy0T8JFY;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B15660A2638
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 11:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B15660A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cy0T8JFY
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so361287f8f.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 03:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795173093; x=1795777893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6iowvnjr0RIgWlIDQQOFrlHY5uCtXtYYlYEEp/cOH20=;
        b=cy0T8JFYf6te/xTc1kjLehflkRMCyCLyy11kt5kR0iiTkUeh72a0VfbQtLsWdxQKbC
         cFhL1NyNlrILzdeaX46VwkVy4MeXP+mFwxsgogALnuIqFabIzDYbfPIl3XyCnmwy3ai5
         8T6EK3t8OE8eX7WpS5CBBnJ9gcHuPx45xGmWl0vctudKI11NB8OsFG4EaWegB9jAqjdE
         yLVMj47I7qQc00jYFIsxNT/1utXJQ9rQvvCMZFbRZLgflQn5wfH6nc0qoZ6hPFJoQBZA
         5jVraI3baGqMgrr/3P3ZFrjwysBQ3aAxoi2icTr9AnuVXVlkHmUvOvgDDhNFO4YMaSSw
         JBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173093; x=1795777893;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6iowvnjr0RIgWlIDQQOFrlHY5uCtXtYYlYEEp/cOH20=;
        b=acb2qIeuTEddiIKZmzmxg0RdijgVWMBYIIhmw/M7L716SkcvzAwi3qNspuSgTFqJ0M
         mBOrolTUI1G+u7Afh55+AZwYcVLWvNHjBS25JTWNt6e1/g3oBVlaWr1ENT9xefH7nqzi
         47I3lNzMwSHM2kObUoY+3+Cv76JtKwKzSeT0hDs+PLvjzB17cdAb9og96leiviaZm7Wu
         61IRFzurwsC7JbKZg5NFB8S7OEOuY632C3jvpPNpVWFV/IuKSLTisxzt0FZp6w59X6DP
         k7PUIXGqUh+7ODK6pGy8dWly3JLD6d2qN5+zaWTSVLaW/JLzzd1r3Z+sbd9LNqm6uxqh
         q9/g==
X-Forwarded-Encrypted: i=1; AL+hErHJBrbTP8bhbe0jiSyGpxhV4avRRqbTMUNFdz2omn0bBSkcQxPqIFp2PDmclKo/khRFlszpxpRZFvItNolok4J/@vger.kernel.org
X-Gm-Message-State: APuU4Z9UFrutZOPR5m02Tv5zvLpRxfuNsH9S51Vx7RjALl44kRow6sG2
	gTRMOEuccNkUt95RLKTIyWOxOXMsaViS7wFhC4S+LU36FqxI2BCZgoJhBnsSUUsdafI=
X-Gm-Gg: AYBFou2PuWHBpo6wlmqDUEgnQQBC+miStdABP0/rdxVPm1e5tm4v9CVoEHce/nkUI+G
	E6sK51NSgvf2FLrAR/ytKE7WsHXPnhGUqnjpSNZwcl9aP6JTCGnSWJE/91fhEbZs/i9bjs/ej5M
	3HWBQlDh8yhnBAEXIwul8yxDPtyKI/JXY3ubdRXAt/KRYJcZ8bjDkAINN0ovbgkhF1/s44a8Z/L
	L9curGJbnDEcvT9t1OuY5UzJw3O1+lKG7zVguhT61CtANg0+uzDEMWyPCx+A3l8LNl0/ihtm6xo
	n4rzN//OBFIQaX6Zrm58gnoibAncP0nYWeY/lfdDCx+fvduPh/JSWR9SEZZtS71dmqUXkrks+2C
	3tAmXN7RrUPNpvfKdJ7YPcFAvGLZO3Z4OBtXC+M7CpA/qZtkgmGI2pU0xCimlt2Sw/LYxLeFpp2
	McbSRAJD2CNrT0nsvUVkj08HtJ19D1hgnNIi31df+z86tQLQ92K+DrAosXbK/WYbIiqtVEzX2U7
	g2O1JQ5CU5sT+t5U4a3LM8bcaqPem4T4MZBtCz2EraUT1h8MiHmCuVjJn59B+9u3evKDrhpoSIx
	EkF/m00A2MZTn9ckvdYpeZmKq0MVKqQ8Ort3gdrFwNg3nvPN65tD1g+J2cvyYV+5+cdqE1M4prR
	5Cy0OwSMHCbeHpL/F
X-Received: by 2002:a05:600c:3b0e:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4bb8882508emr60110635e9.35.1795173092340;
        Fri, 20 Nov 2026 03:11:32 -0800 (PST)
Received: from localhost (p200300f65f19a904be03815e1634e776.dip0.t-ipconnect.de. [2003:f6:5f19:a904:be03:815e:1634:e776])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884a15absm67887745e9.9.2026.11.20.03.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:31 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Longfang Liu <liulongfang@huawei.com>,
	Julian Ruess <julianr@linux.ibm.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	=?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
	Eric Auger <eric.auger@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Brown <broonie@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Jonathan Corbet <corbet@lwn.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Bradley Morgan <bradley.morgan@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Alex Williamson <alex@shazbot.org>,
	Mostafa Saleh <smostafa@google.com>,
	kvm@vger.kernel.org,
	qat-linux@intel.com,
	virtualization@lists.linux.dev,
	intel-xe@lists.freedesktop.org,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 00/10] driver core: Disable driver overriding by default
Date: Fri, 20 Nov 2026 12:11:01 +0100
Message-ID: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4896; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=zb+igsuXLt8tOTuUjhzAr7HaxCaZLq4II70BN40Br9Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrACrJx1qga/LvoqPeQ2w7AGsIzkvZ0u8Ei7ilD OnkWyRDOleJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawAqyQAKCRCPgPtYfRL+ TrT2B/4h+7Q3cE0LlxcXdMzSjo72DibWSV5sOQkmoVdvDT2jirOpWioUU86bki4NAIk6Z4fKuAQ Tq67UAFcdu/x0sb+TsWnSkdYqWbFXP1E9qqHzS6LbgG2Wo9AfXLnJRQPoIkCW5R3i/w6jmyDLiI LkWjw6qUO85o5cf3veZf7uvTVs/F1HlPcGi5H2XR8SEvtsTQoNcOqyDD/XO+JfY5VRim2QTygzC /LqpSYXX2fMI/PZcft+vtXeHkKEsua161Yxgcwt3mnXV1cWuUQhOgqkI5MNgrbn/8PHF60B4GWC cbYFOHiY7+15odYG/kF7YqO0HOLOodN9ndNTOKA9GdiXGD/D
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

here comes v2 which addresses the review feedback I got for (implicit)
v1. See https://lore.kernel.org/linux-kernel/20261116110853.3418077-2-u.kleine-koenig@baylibre.com
for the discussion about that previous submission.
 
The objective is to deny force binding a device to a driver that isn't
prepared for that. There are many drivers that run in a null pointer
exception when this happens and only very few drivers are supposed to be
used like that. So the first patch implements an explicit opt-in for
drivers and denies other matches; the remaining patches implement the
opt-in for drivers that rely on it. This makes it unnecessary to fix
individual drivers to explicitly refuse such bindings. See commit
1e50a0349012 ("iio: adc: mcp3564: reject devices without match data")
for an example of such a driver-specific fix.

Changes since (implicit) v1:
 
 - Rework parameter parsing to just use `allow_driver_override` on the
   kernel commandline
 - Add review tags
 - Add patches by Alex Williamson setting .support_driver_override in
   pci and vfio drivers
 - Add patches for uio, spidev and a few more drivers setting
   .support_driver_override
 - align wording in Documentation/admin-guide/tainted-kernels.rst with 
   tools/debugging/kernel-chktaint

It is sensible to merge the driver core change (patch #1) together with
the individual driver patches setting .support_driver_override because
with the driver core change the driver override doesn't work any more
for the unmodified drivers (unless the new kernel parameter is provided
and a taint is accepted). So I suggest (once there is agreement that the
patches are fine) to merge them all in one go and provide a stable
branch in case a driver was missed to be adapted. I can create such a
branch and ask Greg or Linus to pull it, or Greg can do that.

So if you're the maintainer of one of the drivers touched by patches #2
and later and assuming your ok with that patch, please provide your Ack
(plus the required coordination if applicable) for not merging via your
usual tree.

Best regards
Uwe

Alex Williamson (3):
  PCI: Allow untainted driver_override for PCI stub drivers
  vfio: Allow untainted use of driver_override
  s390/vfio: Allow untainted use of driver_override

Uwe Kleine-König (7):
  driver core: Disable driver overriding by default
  uio: Allow untainted use of driver_override
  spi: spidev: Allow untainted use of driver_override
  clk: imx: scu: Allow untainted use of driver_override
  remoteproc: Allow untainted use of driver_override
  slimbus: qcom-ngd-ctrl: Allow untainted use of driver_override
  ASoC: samsung: i2s: Allow untainted use of driver_override

 .../admin-guide/kernel-parameters.txt         |  6 +++
 Documentation/admin-guide/tainted-kernels.rst | 54 ++++++++++---------
 drivers/base/bus.c                            | 51 ++++++++++++++++++
 drivers/clk/imx/clk-scu.c                     |  1 +
 drivers/pci/pci-pf-stub.c                     |  1 +
 drivers/pci/pci-stub.c                        |  1 +
 drivers/rpmsg/rpmsg_ctrl.c                    |  1 +
 drivers/rpmsg/rpmsg_ns.c                      |  5 +-
 drivers/s390/cio/vfio_ccw_drv.c               |  1 +
 drivers/s390/crypto/vfio_ap_drv.c             |  1 +
 drivers/slimbus/qcom-ngd-ctrl.c               |  1 +
 drivers/spi/spidev.c                          |  1 +
 drivers/uio/uio_dmem_genirq.c                 |  1 +
 drivers/uio/uio_hv_generic.c                  |  1 +
 drivers/uio/uio_pci_generic.c                 |  1 +
 drivers/uio/uio_pdrv_genirq.c                 |  1 +
 drivers/vfio/cdx/main.c                       |  1 +
 drivers/vfio/fsl-mc/vfio_fsl_mc.c             |  1 +
 .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |  3 +-
 drivers/vfio/pci/ism/main.c                   |  3 +-
 drivers/vfio/pci/mlx5/main.c                  |  3 +-
 drivers/vfio/pci/nvgrace-gpu/main.c           |  3 +-
 drivers/vfio/pci/pds/pci_drv.c                |  3 +-
 drivers/vfio/pci/qat/main.c                   |  3 +-
 drivers/vfio/pci/vfio_pci.c                   |  3 +-
 drivers/vfio/pci/virtio/main.c                |  3 +-
 drivers/vfio/pci/xe/main.c                    |  3 +-
 drivers/vfio/platform/vfio_amba.c             |  1 +
 drivers/vfio/platform/vfio_platform.c         |  1 +
 include/linux/device.h                        | 19 +------
 include/linux/device/driver.h                 |  2 +
 include/linux/panic.h                         |  3 +-
 include/trace/events/module.h                 |  3 +-
 kernel/panic.c                                |  3 +-
 sound/soc/samsung/i2s.c                       |  1 +
 tools/debugging/kernel-chktaint               |  9 ++++
 36 files changed, 144 insertions(+), 55 deletions(-)


base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
-- 
2.56.0.rc1

