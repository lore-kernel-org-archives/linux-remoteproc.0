Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH V4 0/4] Add TIOCM Signals support for RPMSG char devices
References: <1538980699-21516-1-git-send-email-aneela@codeaurora.org>
 <a64808ba-3c67-3ee9-9c13-3787e5ce7ab1@st.com>
 <20181008162325.GA1331@tuxbook-pro>
 <a3bba20d-1913-ec4c-f0a9-66413276efd8@st.com>
 <20181009182712.GC28399@tuxbook-pro>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <8efdf3c6-2c52-cff2-d99f-3abb0b54cb31@st.com>
Date: Fri, 12 Oct 2018 11:46:18 +0200
MIME-Version: 1.0
In-Reply-To: <20181009182712.GC28399@tuxbook-pro>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arun Kumar Neelakantam <aneela@codeaurora.org>, ohad@wizery.com, clew@codeaurora.org, sricharan@codeaurora.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>


On 10/09/2018 08:27 PM, Bjorn Andersson wrote:
> On Tue 09 Oct 09:02 PDT 2018, Arnaud Pouliquen wrote:
> 
>> hello Bjorn,
>>
>> On 10/08/2018 06:23 PM, Bjorn Andersson wrote:
>>> On Mon 08 Oct 06:08 PDT 2018, Arnaud Pouliquen wrote:
>>>
>>>> Hi Arun, Bjorn,
>>>>
>>>> On 10/08/2018 08:38 AM, Arun Kumar Neelakantam wrote:
>>>>> Glink transport support signals to exchange state notification between
>>>>> local and remote side clients. Adding support to send/receive the signal
>>>>> command and notify the clients through callback and POLL notification.
>>>>
>>>> Please correct me if i'm wrong...My concern here is that this patchset
>>>> implements a rpmsg service in the rpmsg core. I would separate this from
>>>> the rpmsg core, as this is not part of the rpmsg protocol but seems
>>>> linked to the serial protocol itself.
>>>> Could it be implemented in rpmsg_char, using a dedicated channel...?
>>>>
>>>
>>> rpmsg_char does expose a rpmsg channel (be it virtio, smd or glink) to
>>> user space. This patch series add support for invoking TIOCMGET and
>>> TIOCMSET on these channels.
>>
>> I'm not familiar with this concept, that could explain that i don't
>> understand this patchset...
>>
>> TIOCMGET and TIOCMSET is related to the serial/console flow control, to
>> control remote modem/processor, right?
>>
> 
> Correct, using the known tty ioctls for flow control we allow userspace
> to communicate flow control information to the rpmsg_char driver.
> 
>> it seems be implemented only to support the rpmsg_char ioctl interface.
>> When i have a look to the glink code, signal is treated by a message
>> sent to remote processor. Therefore it seems that it could be treated as
>> a service on top of rpmsg (so treat it in rpmsg_char instead of extend
>> the rpmsg protocol to treat it in glink driver).
>>
> 
> The glink message is a control message, so it's not possible to pass
> this inside a channel. As such it's not possible to solve this entirely
> in rpmsg_char.
> 
> Looking at SMD, this is a set of bits in a per-channel control
> structure. So there it's clearer that it's some side-band control
> information.
> 
> 
> Further more, the rpmsg_char driver just exposes a channel to user
> space, it does not care about the data inside. As such it's not possible
> to generically extend it to support this with in-band messages.
> 
>>>
>>> In addition to adding the client side of this to rpmsg_char it provides
>>> this support for glink, but the same mechanism exists in smd - while
>>> this is not supported (today) by the virtio rpmsg.
>> This is my main concern, i would like to be sure that this service is
>> not related to specific needs introduced by the rmpsg char implementation:
>> In this case this should not be part of the rpmsg core but perhaps some
>> ops directly provided to the rpmsg_char on registration
>> (rpmsg_chrdev_register_device?)...
>>
> 
> Arun's imminent need is for a user space client that needs to flow
> control the incoming data stream. But the possibility of controlling the
> incoming flow of data is useful in a number of situations.
> 
>>>
>>>
>>> I'm uncertain of how we could implement this mechanism for virtio rpmsg,
>>> given that it as a transport doesn't really have a concept of
>>> channels/flows - but it's really useful to have!
>>>
>>> PS. rpmsg_set_signals() can be called from any rpmsg device to perform
>>> flow control of the communication channel.
>>
>> For my point of view this patch-set extends the rpmsg protocol to add
>> channel flow control.
>> Does it make sense to have a flow control in rpmsg protocol?
>> if yes, should it be linked to a channel or to the remote processor itself?
>>
> 
> Having per-channel flow control particularly useful in scenarios where
> one has multiple types of data flowing over a shared underlying FIFO -
> such as virtio rpmsg. As this allows these different applications to
> limit the data rate without having to use application specific side band
> controls.

Agree that per-channel flow control could be useful to give priorities
an limit data flow rate. And as discussed yesterday in Openamp meeting,
rpmsg seems the well place to add a kind of channel controller.

That's means than we should probably need a generic way to configure
flow control, not based on TTY ioctl protocol, but compatible with its
associated feature.

If you need a short term solution, perhaps, a first step could be to
define a more generic API, that would be bypassed to the rpmsg backend
driver...

>From my POV, a blocking point in current patch is that rpmsg_set_signals
and rpmsg_get_signals create dependency between the client the back-end
driver in term of parameters. Both have to know the signification of
these parameters, that are not defined in the interface, but in user
ioctl API. This seems not suitable for non rpmsg_char client that would
use flow control.
Other concern is that the term "signals" seems too generic if it is
dedicated to flow control.

Regards,
Arnaud

> 
>> Extra comment: associated documentation update is missing.
>>
> 
> Good catch, we should have a section in Documentation/rpmsg.txt
> describing this mechanism.
> 
> Regards,
> Bjorn
> 
>> Regards,
>> Arnaud
>>
>>>
>>> Regards,
>>> Bjorn
>>>
>>>> Regards
>>>> Arnaud
>>>>
>>>>>
>>>>> Changes since v1:
>>>>> - Split the patches as per functional areas like core, char, glink
>>>>> - Add set, clear mask for TIOCMSET
>>>>> - Merge the char signal callback and POLLPRI patches
>>>>>
>>>>> Changes since v2:
>>>>> - Modify the rpmsg_get_signals function prototype
>>>>>
>>>>> Changes since v3:
>>>>> - Correct the TICOMGET case handling as per new rpmsg_get_signals prototype
>>>>> - Update the rpmsg_get_signals function header
>>>>>
>>>>> Arun Kumar Neelakantam (4):
>>>>>   rpmsg: core: Add signal API support
>>>>>   rpmsg: glink: Add support to handle signals command
>>>>>   rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
>>>>>   rpmsg: char: Add signal callback and POLLPRI support
>>>>>
>>>>>  drivers/rpmsg/qcom_glink_native.c | 126 ++++++++++++++++++++++++++++++++++++++
>>>>>  drivers/rpmsg/rpmsg_char.c        |  74 +++++++++++++++++++++-
>>>>>  drivers/rpmsg/rpmsg_core.c        |  41 +++++++++++++
>>>>>  drivers/rpmsg/rpmsg_internal.h    |   5 ++
>>>>>  include/linux/rpmsg.h             |  26 ++++++++
>>>>>  5 files changed, 269 insertions(+), 3 deletions(-)
>>>>>
