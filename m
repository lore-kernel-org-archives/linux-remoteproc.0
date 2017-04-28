Return-Path: <dan.j.williams@intel.com>
Subject: [PATCH 0/3] dynamic_hex_dump cleanup
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 28 Apr 2017 14:28:53 -0700
Message-ID: <149341493336.35578.13631055553267152302.stgit@dwillia2-desk3.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-nvdimm@lists.01.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-acpi@vger.kernel.org, Jason Baron <jbaron@akamai.com>
List-ID: <linux-remoteproc@vger.kernel.org>

More than one driver has worked around the fact that
print_hex_dump_debug() requires CONFIG_DYNAMIC_DEBUG=y to build. Provide
a dynamic_hex_dump() so that drivers that want the extra debugging to be
turned off in the CONFIG_DYNAMIC_DEBUG=n can use dynamic_hex_dump()
directly.

I'm fine to carry this whole set through nvdimm.git if no one sees any
issues.

---

Dan Williams (3):
      printk: provide generic dynamic_hex_dump fallback
      virtio, rpmsg: switch to dynamic_hex_dump()
      acpi, nfit: kill ACPI_NFIT_DEBUG, switch to dynamic_hex_dump()


 drivers/acpi/nfit/Kconfig        |   12 ------------
 drivers/acpi/nfit/core.c         |   21 ++++++++-------------
 drivers/rpmsg/virtio_rpmsg_bus.c |    6 ------
 include/linux/dynamic_debug.h    |    6 ++++++
 4 files changed, 14 insertions(+), 31 deletions(-)
