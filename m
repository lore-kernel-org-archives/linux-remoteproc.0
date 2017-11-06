Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 0/2] remoteproc: increase debug capabilities
Date: Mon, 6 Nov 2017 18:09:54 +0100
Message-ID: <1509988196-24377-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This series increases remoteproc debug capabilities by adding:
- associated resource table dump feature
- registered carveouts list dump feature

---
Changes from V1:
- Fix 0-DAY reported issues on open functions prototype
- Rebase on Linux 4.14-rc8

Loic Pallardy (2):
  remoteproc: debug: add resource table dump feature
  remoteproc: debug: add carveouts list dump feature

 drivers/remoteproc/remoteproc_debugfs.c | 130 ++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

-- 
1.9.1
