Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/2] Minor cleanups/improvements in rpmsg-client-sample
Date: Fri, 9 Aug 2019 11:27:08 -0500
Message-ID: <20190809162710.823-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

The following are minor cleanup/improvement patches to the rpmsg_client_sample.
The first patch is new, and the second patch is a repost. Appreciate it if you
can pick these up for 5.4 merge window.

regards
Suman

Suman Anna (2):
  samples/rpmsg: Replace print_hex_dump() with print_hex_dump_debug()
  samples/rpmsg: Introduce a module parameter for message count

 samples/rpmsg/rpmsg_client_sample.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.22.0
