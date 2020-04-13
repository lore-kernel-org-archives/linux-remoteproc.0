Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 0/4] remoteproc: Refactor function rproc_alloc() 
Date: Mon, 13 Apr 2020 13:33:57 -0600
Message-Id: <20200413193401.27234-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: s-anna@ti.com, elder@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

Function rproc_alloc() had to be reworked as part of my work on MCU
synchronisation[1].  Concurrent to that Suman [2] and Alex [3] also did
some work on the same function.  

In order to provide a clean foundation for everyone to work from and avoid
unpleasant merge conflicts this set gathers the work that both Alex and I
did.  That way Suman and I can move forward with our respective patchsets
without too much headache.   

Applies cleanly on v5.7-rc1.

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=261069
[2]. https://patchwork.kernel.org/patch/11456385/
[3]. https://patchwork.kernel.org/patch/11473241/ 

Alex Elder (1):
  remoteproc: Fix a bug in rproc_alloc()

Mathieu Poirier (3):
  remoteproc: Split firmware name allocation from rproc_alloc()
  remoteproc: Split rproc_ops allocation from rproc_alloc()
  remoteproc: Get rid of tedious error path

 drivers/remoteproc/remoteproc_core.c | 101 +++++++++++++++------------
 1 file changed, 58 insertions(+), 43 deletions(-)

-- 
2.20.1
