Return-Path: <christophe.jaillet@wanadoo.fr>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/3] remoteproc: imx_rproc: Improve 'imx_rproc_probe()'
Date: Wed, 14 Mar 2018 20:56:36 +0100
Message-Id: <cover.1521057013.git.christophe.jaillet@wanadoo.fr>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
List-ID: <linux-remoteproc@vger.kernel.org>

Patch 1 fixes a bug.
Patches 2 and 3 are just clean-ups.

Christophe JAILLET (3):
  remoteproc: imx_rproc: Fix an error handling path in
    'imx_rproc_probe()'
  remoteproc: imx_rproc: Re-use existing error handling path in
    'imx_rproc_probe()'
  remoteproc: imx_rproc: Slightly simplify code in 'imx_rproc_probe()'

 drivers/remoteproc/imx_rproc.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

-- 
2.14.1
