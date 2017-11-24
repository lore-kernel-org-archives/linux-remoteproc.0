Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 0/6] System resource management
Date: Fri, 24 Nov 2017 15:36:36 +0100
Message-ID: <1511534202-12995-1-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, arnaud.pouliquen@st.com, "Loic PALLARDY  <loic.pallardy@st.com>, Fabien DESSENNE" <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This RFC follows discussions in OpenAMP meeting around a resource manager 
for the remote processor.
Here is a patchset that implements a system resource management.
By system resource we speak about resource that is requested to operate
a peripheral, used by a remote processor. These resources can introduce 
potential contention if they are not controlled by one core.

In this first patch-set the system resource manager configures and enables 
the following system resources.
- Clocks
- GPIOs
- Regulators 

Theses resources are declared in devicetree sub-nodes of the resource manager.
A subnode corresponds to one peripheral used by the remote processor.
For each peripheral a generic driver can be probed to handle the system
resource. Developer can also define his own driver for more complexe use 
cases.

Know limitations:
- Assignement of a peripheral is static. Means that peripheral assignement
  can not switch from one core to another core during runtime.
- Configuration of the system resources are also static. No update of a 
resource configuration during runtime.

=> Both limitations could be treated adding in a dynamic aspect based on a 
RPMsg service.
TI already implements a solution (which could be easily port on the top of this series):  
http://git.omapzoom.org/?p=repo/sysbios-rpmsg.git;a=summary


Fabien Dessenne (6):
  remoteproc: add early probed subdevices
  dt-bindings: remoteproc: add system resource manager (SRM)
  remoteproc: add system resource manager core
  remoteproc: add system resource manager device
  remoteproc: Add posibility to probe a sub device.
  remoteproc: sti: select srm

 .../devicetree/bindings/remoteproc/rproc-srm.txt   |  45 ++
 Documentation/remoteproc.txt                       |  23 +
 drivers/remoteproc/Kconfig                         |  20 +
 drivers/remoteproc/Makefile                        |   2 +
 drivers/remoteproc/remoteproc_core.c               |  70 +++-
 drivers/remoteproc/rproc_srm_core.c                | 202 +++++++++
 drivers/remoteproc/rproc_srm_dev.c                 | 462 +++++++++++++++++++++
 include/linux/remoteproc.h                         |   7 +
 8 files changed, 820 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/rproc-srm.txt
 create mode 100644 drivers/remoteproc/rproc_srm_core.c
 create mode 100644 drivers/remoteproc/rproc_srm_dev.c

-- 
2.7.4
