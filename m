Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH 0/2] remoteproc: increase debug capabilities
Date: Fri, 27 Oct 2017 14:41:20 +0200
Message-ID: <1509108082-22201-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This series increases remoteproc debug capabilities by adding:
- associated resource table dump feature
- registered carveouts list dump feature

Loic Pallardy (2):
  remoteproc: debug: add resource table dump feature
  remoteproc: debug: add carveouts list dump feature

 drivers/remoteproc/remoteproc_debugfs.c | 130 ++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

-- 
1.9.1
