Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Wed, 1 Apr 2020 15:39:53 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 00/17] remoteproc: Add support for synchronisation
 with MCU
Message-ID: <20200401213953.GF17383@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <4d264de6259449338cef9b2da1f39304@SFHDAG7NODE2.st.com>
 <172c8ba5-f365-5e63-cc39-94dfe1bafa9f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172c8ba5-f365-5e63-cc39-94dfe1bafa9f@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: Loic PALLARDY <loic.pallardy@st.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "peng.fan@nxp.com" <peng.fan@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Mar 31, 2020 at 05:51:44PM -0500, Suman Anna wrote:
> Hi Mathieu,
> 
> On 3/27/20 12:20 PM, Loic PALLARDY wrote:
> > Hi Mathieu,
> > 
> >>
> >> This is the second revision of this set that tries to address the
> >> problem of synchronising with an MCU with as much flexibility as
> >> possible.
> >>
> >> New in this revision is a fix for a couple of bugs I found while
> >> testing things.  First with the helper macro in patch 09 and the
> >> suppression of a boot message when synchronising with an MCU
> >> in patch 12.  I have completely removed what used to be patch 18,
> >> the example on how to use the new API.  This will be the subject
> >> of an upcoming patchset.
> >>
> >> Tested on ST's mp157c platform.  Applies on v5.6-rc7 to keep things
> >> simple.
> > 
> > Thanks Mathieu for the 2 series. I tested on my STM32MP157-DK2 the different
> > synchronization use cases (on_init, after_stop, after_crash), mixing the values and
> > I succeed to start/stop/restart M4 coprocessor with or without reloading firmware
> > according to sync values. (I only applied the correction I proposed in patch 16 review
> > to allow to resync with a preloaded or an already running coprocessor.
> > 
> > Regards,
> > Loic
> >>
> >> Comments would be much appreciated.
> 
> Thank you for the enhanced series to implement the logic in remoteproc
> core. I have provided my comments on most of the patches.
> 
> Overall, I can see my early-boot scenarios work with the series, and the
> slightly different userspace-loading support usecase would need some
> additional support.
> 
> As I commented on patch 1 in v1, I would rather reuse the the generic
> "rproc" instead of adding a new "mcu" terminology to code.. Let's just
> stick with the rproc

You got it.

> 
> Another thing I would prefer (echoing my comments on patch 7) is to just
> use an API for modifying the sync states, that can be used between
> rproc_alloc() and rproc_add(). The state-machine really doesn't kick in
> until rproc_add() is invoked. The memory for the driver private rproc
> structure is allocated using rproc_alloc() normally, and most of the
> DT-parsing in platform drivers is generally done directly into this
> allocated memory. I see it a bit cumbersome having to maintain a
> separate structure, and then do a memcpy, especially given that the
> rproc_alloc_state_machine() logic requires that you detect the state
> before calling the rproc_alloc().

You raise an interesting point... As my work on the mp157c [1] proved, mandating
to know if the core should sync before calling rproc_alloc_state_machine()
requires a fair amount of refactoring.  I will follow your recommendation for
the next revision.

Thanks,
Mathieu


[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=261083

> 
> regards
> Suman
> 
> >>
> >> Thanks,
> >> Mathieu
> >>
> >> Mathieu Poirier (17):
> >>   remoteproc: Add new operation and state machine for MCU
> >>     synchronisation
> >>   remoteproc: Introduce function rproc_set_mcu_sync_state()
> >>   remoteproc: Split firmware name allocation from rproc_alloc()
> >>   remoteproc: Split rproc_ops allocation from rproc_alloc()
> >>   remoteproc: Get rid of tedious error path
> >>   remoteproc: Introduce function rproc_alloc_internals()
> >>   remoteproc: Introduce function rproc_alloc_state_machine()
> >>   remoteproc: Allocate synchronisation state machine
> >>   remoteproc: Call the right core function based on synchronisation
> >>     state
> >>   remoteproc: Decouple firmware load and remoteproc booting
> >>   remoteproc: Repurpose function rproc_trigger_auto_boot()
> >>   remoteproc: Rename function rproc_fw_boot()
> >>   remoteproc: Introducting new functions to start and stop an MCU
> >>   remoteproc: Refactor function rproc_trigger_recovery()
> >>   remoteproc: Correctly deal with MCU synchronisation when changing FW
> >>     image
> >>   remoteproc: Correctly deal with MCU synchronisation when changing
> >>     state
> >>   remoteproc: Make MCU synchronisation state changes on stop and crashed
> >>
> >>  drivers/remoteproc/remoteproc_core.c     | 387 ++++++++++++++++++-----
> >>  drivers/remoteproc/remoteproc_debugfs.c  |  31 ++
> >>  drivers/remoteproc/remoteproc_internal.h |  91 ++++--
> >>  drivers/remoteproc/remoteproc_sysfs.c    |  57 +++-
> >>  include/linux/remoteproc.h               |  28 +-
> >>  5 files changed, 487 insertions(+), 107 deletions(-)
> >>
> >> --
> >> 2.20.1
> > 
> 
