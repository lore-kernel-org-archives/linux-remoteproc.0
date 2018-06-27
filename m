Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [RFC v2 0/5] System resource management
Date: Wed, 27 Jun 2018 10:06:17 +0200
Message-ID: <1530086782-5046-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Loic Pallardy <loic.pallardy@st.com>, Oleksij
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>, Alex Elder <elder@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This RFC follows discussions in OpenAMP meeting around a resource manager 
for the remote processor.
Here is a patchset that implements a system resource management.
By 'system resource' we speak about resource that is requested to operate
a peripheral, used by a remote processor.
Note: 'shared resource' may be a more appropriate term than 'system resource'.
These 'system resources' can introduce potential contention if they are not
controlled by a master core.

The system resource manager configures and enables the following identified
'system resources':
- Clocks
- GPIOs
- Regulators
- Interrupts

Theses 'system resources' are declared in devicetree sub-nodes of the resource
manager. A subnode corresponds to one peripheral used by the remote processor.
For each peripheral a generic driver can be probed to handle the 'system
resource'. Developers can also define their own driver for more complexe use
cases.

In this second patchset the configuration of the 'system resources' is not only
static : it can be updated during runtime ('dynamic' resource management).
The implementation of this part relies on an an RPMSG service and offers the
remote processor the ability to get and set the following configurations:
- Clock enable / disable
- Clock rate
- Regulator enable / disable
- Regulator voltage (min/max, current)
- Pin state configuration
The proposed implementation allows to extend the list of 'system resources' and
configurations.

Notes:
1- This patchset depends on the "remoteproc: updates for new events" patchset
   submitted by Alex Elder [https://lkml.org/lkml/2018/6/25/1081]
2- This proposed implementation deals with 'system resources', not with
   peripheral: hence it does not propose to assign a peripheral from one core
   to another core during runtime.
3- See also TI proposed solution:
   [http://git.omapzoom.org/?p=repo/sysbios-rpmsg.git;a=summary]

v2 changes :
- Add interrupts as a 'system resource'
- Add RPMSG-based 'dynamic' resource management

Fabien Dessenne (5):
  dt-bindings: remoteproc: add system resource manager (SRM)
  remoteproc: add system resource manager core
  remoteproc: add system resource manager device
  remoteproc: probe the system resource manager
  remoteproc: srm: introduce dynamic resource manager

 .../devicetree/bindings/remoteproc/rproc-srm.txt   |  54 ++
 Documentation/remoteproc.txt                       |  23 +
 drivers/remoteproc/Kconfig                         |  18 +
 drivers/remoteproc/Makefile                        |   2 +
 drivers/remoteproc/remoteproc_core.c               |   8 +
 drivers/remoteproc/rproc_srm_core.c                | 295 +++++++
 drivers/remoteproc/rproc_srm_core.h                | 113 +++
 drivers/remoteproc/rproc_srm_dev.c                 | 890 +++++++++++++++++++++
 8 files changed, 1403 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/rproc-srm.txt
 create mode 100644 drivers/remoteproc/rproc_srm_core.c
 create mode 100644 drivers/remoteproc/rproc_srm_core.h
 create mode 100644 drivers/remoteproc/rproc_srm_dev.c

-- 
2.7.4
