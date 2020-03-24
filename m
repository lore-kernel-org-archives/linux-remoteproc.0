Return-Path: <t-kristo@ti.com>
From: Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv9 00/15] remoteproc: updates for omap remoteproc support
Date: Tue, 24 Mar 2020 13:00:20 +0200
Message-ID: <20200324110035.29907-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mathieu.poirier@linaro.org, s-anna@ti.com, afd@ti.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

v9 is just a rebase on top of rproc-next (I am optimistic here still
assuming that maintainers would pick this up for 5.7), and fixing one
final comment from Mathieu on patch #14. Rebase on top of rproc-next
causes a couple of minor changes to fix compile breakages compared to v8
of this series (some APIs have changed slightly, see patch #3, #5 and #7.)

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
